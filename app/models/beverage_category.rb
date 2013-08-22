class BeverageCategory < Category
  has_many :beverages, dependent: :restrict_with_exception
end
