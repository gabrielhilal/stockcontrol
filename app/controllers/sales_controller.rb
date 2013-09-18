class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :manager
  before_action :right_user, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Listing Sales'
    if current_user.director?
      @sales = Sale.search(params[:search]).order(params[:sort])
    else
      @sales = Sale.search(params[:search]).where(venue_id: current_user.venue_id).order(params[:sort])
    end
  end

  def show
    @title = "Sale on #{get_date}"
  end

  def new
    @title = 'New Sale'
    @sale = Sale.new
    @sale.date ||= Date.today
    @menu = Menu.where(current: true).first
    @menu.menu_lines.each do |line|
      @sale.sale_lines.build(beverage_id: line.beverage_id, price: line.price)
    end
  end

  def edit
    @title = "Editing sale on #{get_date}"
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.venue_id = current_user.venue_id unless current_user.director?
    if @sale.save
      flash[:notice] = "Sales on #{get_date} added"
      redirect_to sale_path(@sale)
    else
      render 'new'
    end
  end

  def update
    if @sale.update(sale_params)
      flash[:notice] = "Sale on #{get_date} updated"
      redirect_to sale_path(@sale)
    else
      render 'edit'
    end
  end

  def destroy
    @sale.destroy
    flash[:notice] = "Sale on #{get_date} deleted"
    redirect_to sales_path
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:date, :summary, :venue_id, sale_lines_attributes: [ :id, :beverage_id, :sale_id, :quantity, :price, :_destroy ])
    end

    def get_date
      @sale.date.strftime('%d/%m/%Y')
    end

    def right_user
      @sale = Sale.find(params[:id])
      unless current_user.director? or @sale.venue_id == current_user.venue_id
        flash[:error] = 'Authorisation is required to access this content.'
        redirect_to sales_path
      end
    end
end

