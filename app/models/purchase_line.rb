class PurchaseLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase
  validates :product_id, :quantity, :price, presence: true

  def subtotal
    quantity * price
  end
end
