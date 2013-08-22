class Supplier < ActiveRecord::Base
  has_many :purchases, dependent: :restrict_with_exception
  validates :name, :telephone, :email, presence: true
  validates :name, uniqueness: true
end
