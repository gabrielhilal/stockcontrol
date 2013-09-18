class TransferStocksController < ApplicationController
  before_action :set_transfer, only: [:confirm, :show, :edit, :update, :destroy]
  before_action :supervisor
  before_action :manager, only: [:edit, :update, :destroy]
  before_action :is_confirmed?, only: [:edit, :update, :destroy]

  def index
    @title = 'Listing Transfers of Stock'
    @transfers = TransferStock.order(:date)
    if current_user.director?
      @not_wastage = @transfers.where.not(recipient_id: nil).order(params[:sort_table1])
      @wastage = @transfers.where(recipient_id: nil).order(params[:sort_table2])
    else
      @sent = @transfers.where(sender_id: current_user.venue_id).order(params[:sort_table1])
      @received = @transfers.where(recipient_id: current_user.venue_id).order(params[:sort_table2])
    end
  end

  def new
    @title = 'New Transfer of Stock'
    @transfer = TransferStock.new
    @transfer.date ||= Date.today
    @transfer.status ||= true if current_user.manager?
    @transfer.transfer_lines.build
  end

  def show
    @title = "Transfer of Stock on #{get_date}"
  end

  def edit
    @title = "Editing Transfer of Stock on #{get_date}"
  end

  def create
    @transfer = TransferStock.new(transfer_params)
    @transfer.status ||= false
    @transfer.sender_id = current_user.venue_id unless current_user.director?
    if @transfer.save
      flash[:notice] = "Transfer on #{get_date} created"
      redirect_to transfer_stock_path(@transfer)
    else
      render 'new'
    end
  end

  def update
    if @transfer.update(transfer_params)
      flash[:notice] = "Transfer on #{get_date} updated"
      redirect_to transfer_stock_path(@transfer)
    else
      render 'edit'
    end
  end

  def destroy
    @transfer.destroy
    flash[:notice] = "Transfer on #{get_date} deleted"
    redirect_to transfer_stocks_path
  end

  def confirm
    @transfer.update(status: true)
    flash[:notice] = "Transfer #{get_date} confirmed"
    redirect_to transfer_stocks_path
  end

  private
    def set_transfer
      @transfer = TransferStock.find(params[:id])
    end

    def transfer_params
      params.require(:transfer_stock).permit(:date, :status, :description, :sender_id, :recipient_id, transfer_lines_attributes: [ :id, :product_id, :transfer_stock_id, :quantity, :_destroy ])
    end

    def get_date
      @transfer.date.strftime('%d/%m/%Y')
    end

    def is_confirmed?
      @transfer = TransferStock.find(params[:id])
      unless current_user.director?
        if @transfer.status
          flash[:error] = "Transfer cannot be edited/deleted. Already received and confirmed"
          redirect_to transfer_stocks_path
        end
      end
    end
end

