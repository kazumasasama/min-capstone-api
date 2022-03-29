class Product < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1,}
  # validates :description, length: {maximum: 500, :minimum: 10}
  belongs_to :user
  belongs_to :supplier
  #  same as above
  # def supplier
  #   supplier = Supplier.find(supplier_id)
  # end
  has_many :images
  has_many :carted_products
  has_many :order, through: :carted_products
  
  has_many :category_products

  # 登録されているカテゴリーを全て呼び出す
  has_many :categories, through: :category_products

  def is_discounted?
    # if price < 10
    #   return true
    # end
    # return false

    # same as avove
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
