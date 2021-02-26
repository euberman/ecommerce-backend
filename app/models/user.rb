class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false}
  validates :email, :firstname, :lastname, :password, presence: true

  has_many :orders
  has_many :reviews
  has_many :favorites
  has_many :products, through: :favorites

  def favorites_count
    self.favorites.count
  end

  def reviews_count
    self.reviews.count
  end

end