class ProductCategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :director

  def index
    @categories = ProductCategory.order(:name)
  end

  def new
    @category = ProductCategory.new
  end

  def edit
  end

  def create
    @category = ProductCategory.new(category_params)
    if @category.save
      flash[:notice] = "Category #{get_name} created"
      redirect_to product_categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category #{get_name} updated"
      redirect_to product_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    if @category.products.exists?
      flash[:error] = "Category #{get_name} cannot be deleted. Delete the related products first"
    else
    @category.destroy
    flash[:notice] = "Category #{get_name} deleted"
    end
    redirect_to product_categories_path
  end

  private
    def set_category
      @category = ProductCategory.find(params[:id])
    end

    def category_params
      params.require(:product_category).permit(:name, :description)
    end

  def get_name
    @category.name
  end
end
