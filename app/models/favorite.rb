class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def product
  #   self.product
  # end

end
