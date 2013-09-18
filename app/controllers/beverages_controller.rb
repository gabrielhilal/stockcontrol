class BeveragesController < ApplicationController
  before_action :set_beverage, only: [:show, :edit, :update, :destroy]
  before_action :manager, except: :spec

  def index
    @title = 'Listing Beverages'
    @beverages = Beverage.search(params[:search]).order(params[:sort])
  end

  def show
    @title = "Beverage #{get_name}"
  end

  def spec
    @title = "Beverage's Recipe"
    @categories = BeverageCategory.all
    @beverages = Beverage.where(beverage_category_id: params[:category])
  end

  def new
    @title = 'New Beverage'
    @beverage = Beverage.new
    2.times { @beverage.recipes.build }
  end

  def edit
    @title = "Edit #{get_name}"
  end

  def create
    @beverage = Beverage.new(beverage_params)
    if @beverage.save
      flash[:notice] = "Beverage #{get_name} created"
      redirect_to beverages_path
    else
      render 'new'
    end
  end

  def update
    if @beverage.update(beverage_params)
      flash[:notice] = "Beverage #{get_name} updated"
      redirect_to beverages_path
    else
      render 'edit'
    end
  end

  def destroy
    if @beverage.sales.exists?
      flash[:error] = "Beverage #{get_name} cannot be deleted. Delete the related sales first"
    elsif @beverage.menus.exists?
      flash[:error] = "Beverage #{get_name} cannot be deleted. Delete the related menus first"
    else
      @beverage.destroy
      flash[:notice] = "Beverage #{get_name} deleted"
    end
    redirect_to beverages_path
  end

  private
    def set_beverage
      @beverage = Beverage.find(params[:id])
    end

    def beverage_params
      params.require(:beverage).permit(:name, :glass, :ice, :description, :method, :beverage_category_id, recipes_attributes: [ :id, :product_id, :beverage_id, :quantity, :_destroy ])
    end

  def get_name
    @beverage.name
  end
end

