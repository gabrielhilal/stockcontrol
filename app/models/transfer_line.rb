class TransferLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :transfer_stock
  validates :product_id, :quantity, presence: true
end
