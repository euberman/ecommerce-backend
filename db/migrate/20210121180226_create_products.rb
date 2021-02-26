class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :product_id
      t.string :department
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :rating
      t.integer :num_reviews
      t.boolean :in_stock
      t.integer :stock
      t.string :price

      t.timestamps
    end
  end
end
