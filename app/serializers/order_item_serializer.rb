class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :title, :qty, :price, :subtotal
end
