class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def product_title
    self.product.title
  end

end
