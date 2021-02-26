class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :brand, :department, :in_stock, :stock, :image_url, :rating, :num_reviews, :favorites_count

  def num_reviews
    self.object.reviews_count
  end

  def rating
    self.object.avg_rating
  end

  # def rating
  #   self.object.calculate_average
  # end

  def favorites_count
    self.object.favorites_count
  end
end
