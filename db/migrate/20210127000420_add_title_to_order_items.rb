class AddTitleToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :title, :string
    add_column :order_items, :image_url, :string
  end
end
