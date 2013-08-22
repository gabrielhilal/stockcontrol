class MenuLine < ActiveRecord::Base
  belongs_to :menu
  belongs_to :beverage
  validates :beverage_id, :price, presence: true
end
