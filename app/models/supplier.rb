class Supplier < ApplicationRecord
  has_many :products
  # same as above
  # def products
  #   Product.where(supplier_id: id)
  # end

end
