class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :director, except: [:stock]
  before_action :supervisor, only: [:stock]

  def index
    @products = Product.search(params[:search]).order(params[:sort])
  end

  def stock
    @products = Product.order(params[:sort])
    @venues = Venue.all
  end

  def new
    @product = Product.new
  end

  def show
    start_date = Date.today << (params[:period].nil? ? 12 : params[:period].to_f)
    date_range = (start_date..Date.today).select {|d| d.day == 1}

    @price = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Average Purchase Price by Supplier")
      f.xAxis(
        type: "datetime"
      )
      f.yAxis(
        title: { text: "Pounds (£)"}
      )
      f.tooltip(
        valuePrefix: '£'
      )
      f.legend(
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
      )
      Supplier.all.each do |supplier|
        price_values_range = @product.price_month(supplier.id)
        price_serie = date_range.map{|date| price_values_range.reject{ |key| key != date}.map{|key, value| value.to_f} }.map{|x| x.empty? ? 0 : x}.flatten
        f.series(
          name: supplier.name,
          pointInterval: 1.month,
          pointStart: start_date,
          data: price_serie
        )
        end
    end

    @purchases = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Quantity Purchased by Venue")
      f.xAxis(
        type: "datetime"
      )
      f.yAxis(
        title: { text: "Quantity"}
      )
      f.tooltip(
        valueSuffix: ' units'
      )
      f.legend(
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
      )
      Venue.all.each do |venue|
        purchases_values_range = @product.purchase_month(venue.id)
        purchases_serie = date_range.map{|date| purchases_values_range.reject{ |key| key != date}.map{|key, value| value.to_f} }.map{|x| x.empty? ? 0 : x}.flatten
        f.series(
            name: venue.name,
            pointInterval: 1.month,
            pointStart: start_date,
            data: purchases_serie
        )
      end
    end

    @sales = LazyHighCharts::HighChart.new('graph') do |f|
          f.title(text: "Quantity Sold by Venue")
          f.xAxis(
            type: "datetime"
          )
          f.yAxis(
            title: { text: "Quantity"}
          )
          f.tooltip(
            valueSuffix: ' units'
          )
          f.legend(
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
          )
          Venue.all.each do |venue|
            sales_values_range = @product.sale_month(venue.id)
            sale_serie = date_range.map{|date| sales_values_range.reject{ |key| key != date}.map{|key, value| value.to_f} }.map{|x| x.empty? ? 0 : x}.flatten
            f.series(
                name: venue.name,
                pointInterval: 1.month,
                pointStart: start_date,
                data: sale_serie
            )
          end
    end
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
