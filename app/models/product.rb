class Product < ActiveRecord::Base
  belongs_to :product_category

  has_many :purchase_lines, dependent: :restrict_with_exception
  has_many :purchases, through: :purchase_lines

  has_many :recipes, dependent: :restrict_with_exception
  has_many :beverages, through: :recipes

  validates :product_category_id, :name, :quantity, :measure, presence: true
  validates :name, uniqueness: true

  def display_details
    "#{name} - #{quantity}/#{measure}"
  end
end
