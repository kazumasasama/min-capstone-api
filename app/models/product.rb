class Product < ApplicationRecord

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
