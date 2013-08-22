class SaleLine < ActiveRecord::Base
  belongs_to :sale
  belongs_to :beverage
  validates :beverage_id, :quantity, :price, presence: true

  def subtotal
    quantity * price
  end
end
