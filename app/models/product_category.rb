class ProductCategory < Category
  has_many :products, dependent: :restrict_with_exception
end
