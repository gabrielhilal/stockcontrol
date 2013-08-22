class Beverage < ActiveRecord::Base
  belongs_to :beverage_category

  has_many :recipes, dependent: :delete_all
  accepts_nested_attributes_for :recipes, reject_if: proc { |attributes| attributes[:product_id].blank?}, allow_destroy: true
  has_many :products, through: :recipes

  has_many :sale_lines, dependent: :restrict_with_exception
  has_many :sales, through: :sale_lines

  has_many :menu_lines, dependent: :restrict_with_exception
  has_many :menus, through: :menu_lines

  validates :beverage_category_id, :name, presence: true
  validates :name, uniqueness: true

end
