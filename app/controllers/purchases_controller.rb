class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :manager
  before_action :right_user, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Listing Purchases'
    if current_user.director?
      @purchases = Purchase.search(params[:search]).order(params[:sort])
    else
      @purchases = Purchase.search(params[:search]).where(venue_id: current_user.venue_id).order(params[:sort])
    end
  end

  def show
    @title = "Purchase #{get_number}"
  end

  def new
    @title = 'New Purchase'
    @purchase = Purchase.new
    @purchase.date ||= Date.today
    3.times { @purchase.purchase_lines.build }
  end

  def edit
    @title = "Editing #{get_number}"
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.venue_id = current_user.venue_id unless current_user.director?
    if @purchase.save
      flash[:notice] = "Purchase #{get_number} added"
      redirect_to purchase_path(@purchase)
    else
      render 'new'
    end
  end

  def update
    if @purchase.update(purchase_params)
      flash[:notice] = "Purchase #{get_number} updated"
      redirect_to purchase_path(@purchase)
    else
      render 'edit'
    end
  end

  def destroy
    @purchase.destroy
    flash[:notice] = "Purchase #{get_number} deleted"
    redirect_to purchases_path
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:no, :date, :supplier_id, :venue_id, purchase_lines_attributes: [ :id, :product_id, :purchase_id, :quantity, :price, :_destroy ])
    end

    def get_number
      @purchase.no
    end

    def right_user
      @purchase = Purchase.find(params[:id])
      unless current_user.director? or @purchase.venue_id == current_user.venue_id
        flash[:error] = 'Authorisation is required to access this content.'
        redirect_to purchases_path
      end
    end
end

