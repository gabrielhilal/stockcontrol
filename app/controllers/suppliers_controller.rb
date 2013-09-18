class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:edit, :update, :destroy]
  before_action :director

  def index
    @title = 'Listing Suppliers'
    @suppliers = Supplier.order(params[:sort])
  end

  def new
    @title = 'New Suppliers'
    @supplier = Supplier.new
  end

  def edit
    @title = "Editing #{get_name}"
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:notice] = "Supplier #{get_name} created"
      redirect_to suppliers_path
    else
      render 'new'
    end
  end

  def update
    if @supplier.update(supplier_params)
      flash[:notice] = "Supplier #{get_name} updated"
      redirect_to suppliers_path
    else
      render 'edit'
    end
  end

  def destroy
    if @supplier.purchases.exists?
      flash[:error] = "Supplier #{get_name} cannot be deleted. Delete the related purchases first"
    else
    @supplier.destroy
    flash[:notice] = "Supplier #{get_name} deleted"
    end
    redirect_to suppliers_path
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :telephone, :email)
    end

  def get_name
    @supplier.name
  end
end