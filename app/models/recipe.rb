class Recipe < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :product
  validates :product_id, :quantity, presence: true

end
