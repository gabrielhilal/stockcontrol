class Venue < ActiveRecord::Base
  has_many :users, dependent: :restrict_with_exception

  has_many :purchases, dependent: :restrict_with_exception

  has_many :sales, dependent: :restrict_with_exception

  validates :name, :telephone, :email, presence: true
  validates :name, uniqueness: true

  has_many :sent_stocks, class_name: 'TransferStock', foreign_key: :sender_id, dependent: :restrict_with_exception
  has_many :received_stocks, class_name: 'TransferStock', foreign_key: :recipient_id, dependent: :restrict_with_exception

  def calc_sales(product)
    sales.joins(sale_lines: { beverage: :recipes }).where(recipes: { product_id: product.id }).sum('sale_lines.quantity * recipes.quantity')
  end

  def calc_purchases(product)
    purchases.joins(:purchase_lines).where(purchase_lines: { product_id: product.id }).sum('purchase_lines.quantity')
  end

  def calc_sent_stock(product)
    sent_stocks.where(status: true).joins(:transfer_lines).where(transfer_lines: { product_id: product.id }).sum('transfer_lines.quantity')
  end

  def received_stock(product)
    received_stocks.where(status: true).joins(:transfer_lines).where(transfer_lines: { product_id: product.id }).sum('transfer_lines.quantity')
  end

  def calc_stock(product)
    ((calc_purchases(product) - calc_sent_stock(product) + received_stock(product)) * Product.find(product.id).quantity - calc_sales(product))/Product.find(product.id).quantity
  end
end
