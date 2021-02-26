class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :user_name, :product_id, :product_title, :rating, :product

  def user_name
    name = "#{self.object.user.firstname} #{self.object.user.lastname}"
    name
  end

  def product_title
    title = "#{self.object.product.title}"
    title
  end
  
end
