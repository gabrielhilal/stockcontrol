class Venue < ActiveRecord::Base
  has_many :users, dependent: :restrict_with_exception

  has_many :purchases, dependent: :restrict_with_exception

  has_many :sales, dependent: :restrict_with_exception

  validates :name, :telephone, :email, presence: true
  validates :name, uniqueness: true

  def calc_sales(product)
    sales.joins(sale_lines: { beverage: :recipes }).where(recipes: { product_id: product.id }).sum('sale_lines.quantity * recipes.quantity')
  end

  def calc_purchases(product)
    purchases.joins(:purchase_lines).where(purchase_lines: { product_id: product.id }).sum('purchase_lines.quantity')
  end

  def calc_stock(product)
    (calc_purchases(product) * Product.find(product.id).quantity - calc_sales(product))/Product.find(product.id).quantity
  end
end
