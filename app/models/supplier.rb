class Supplier < ActiveRecord::Base
  has_many :purchases, dependent: :restrict_with_exception
  validates :name, presence: true
  validates :name, uniqueness: true
end
