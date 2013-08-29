class Product < ActiveRecord::Base
  belongs_to :product_category

  has_many :purchase_lines, dependent: :restrict_with_exception
  has_many :purchases, through: :purchase_lines

  has_many :recipes, dependent: :restrict_with_exception
  has_many :beverages, through: :recipes

  has_many :transfer_lines, dependent: :restrict_with_exception
  has_many :transfer_stocks, through: :transfer_lines

  validates :product_category_id, :name, :quantity, :measure, presence: true
  validates :name, uniqueness: true

  def display_details
    "#{name} - #{quantity}/#{measure}"
  end

  def self.search(search)
    if search
      where('products.name ILIKE ? OR products.description ILIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def purchase_month(venue_id)
    purchase_lines.joins(:purchase).where('purchases.venue_id = ?', venue_id).group_by_month('purchases.date').order("month asc").sum('purchase_lines.quantity')
  end

  def sale_month(venue_id)
    recipes.joins(:product, beverage: { sale_lines: :sale }).where('sales.venue_id = ?', venue_id).group_by_month('sales.date').order("month asc").sum('sale_lines.quantity * recipes.quantity / products.quantity')
  end

  def price_month(supplier_id)
    purchase_lines.joins(:purchase).where('purchases.supplier_id = ?', supplier_id).group_by_month('purchases.date').order("month asc").average('purchase_lines.price')
  end

end
