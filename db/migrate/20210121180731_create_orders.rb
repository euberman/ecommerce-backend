class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :total
      t.integer :item_count
      t.boolean :isShipped, default:false
      t.boolean :paid, default:false
      t.string :payment
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip

      t.timestamps
    end
  end
end
