class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :director, except: [:stock]
  before_action :supervisor, only: [:stock]

  def index
    @products = Product.order(params[:sort])
  end

  def stock
    @products = Product.order(params[:sort])
    @venues = Venue.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product #{get_name} created"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product #{get_name} updated"
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    if @product.purchases.exists?
      flash[:error] = "Product #{get_name} cannot be deleted. Delete the related purchases first"
    else
      @product.destroy
      flash[:notice] = "Product #{get_name} deleted"
    end
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :measure, :quantity, :product_category_id)
    end

  def get_name
    @product.name
  end
end
