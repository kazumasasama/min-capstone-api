class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :category_products
end
