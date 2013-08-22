class BeverageCategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :manager

  def index
    @categories = BeverageCategory.order(:name)
  end

  def new
    @category = BeverageCategory.new
  end

  def edit
  end

  def create
    @category = BeverageCategory.new(category_params)
    if @category.save
      flash[:notice] = "Category #{get_name} created"
      redirect_to beverage_categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category #{get_name} updated"
      redirect_to beverage_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    if @category.beverages.exists?
      flash[:error] = "Category #{get_name} cannot be deleted. Delete the related beverages first"
    else
    @category.destroy
      flash[:notice] = "Category #{get_name} deleted"
    end
    redirect_to beverage_categories_path
  end

  private
    def set_category
      @category = BeverageCategory.find(params[:id])
    end

    def category_params
      params.require(:beverage_category).permit(:name, :description)
    end

  def get_name
    @category.name
  end
end

