class BeveragesController < ApplicationController
  before_action :set_beverage, only: [:show, :edit, :update, :destroy]
  before_action :manager

  def index
    @beverages = Beverage.order(params[:sort])
  end

  def show
  end

  def new
    @beverage = Beverage.new
    2.times { @beverage.recipes.build }
  end

  def edit
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
    #add cannot delete if sales exist
    if @beverage.update(beverage_params)
      flash[:notice] = "Beverage #{get_name} updated"
      redirect_to beverages_path
    else
      render 'edit'
    end
  end

  def destroy
    #add cannot delete if sales exist
    @beverage.destroy
    flash[:notice] = "Beverage #{get_name} deleted"
    redirect_to beverages_path
  end

  private
    def set_beverage
      @beverage = Beverage.find(params[:id])
    end

    def beverage_params
      params.require(:beverage).permit(:name, :glass, :description, :method, :beverage_category_id, recipes_attributes: [ :id, :product_id, :beverage_id, :quantity, :_destroy ])
    end

  def get_name
    @beverage.name
  end
end

