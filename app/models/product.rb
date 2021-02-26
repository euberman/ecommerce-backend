class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites

  def avg_rating
    count = self.reviews_count
    if (count > 0)
      ratingSum = self.reviews.sum(:rating)
      avg = ratingSum / count
      return avg
    else
      return 0
    end
  end

  def reviews_count
    self.reviews.count
  end

  def favorites_count
    self.favorites.count
  end

  # Get the average rating of all reviews for a product
  def calculate_average
    return 0 unless reviews.size.positive?
    avg = self.reviews.average(:rating) #.to_f.round(2) # * 100
    update_column(:rating, avg)
  end
end
