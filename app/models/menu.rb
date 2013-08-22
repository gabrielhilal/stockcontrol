class Menu < ActiveRecord::Base
  has_many :menu_lines, dependent: :delete_all
  accepts_nested_attributes_for :menu_lines, reject_if: proc { |attributes| attributes[:beverage_id].blank?}, allow_destroy: true
  has_many :beverages, through: :menu_lines

  validates :name, presence: true
  validates :name, uniqueness: true
end
