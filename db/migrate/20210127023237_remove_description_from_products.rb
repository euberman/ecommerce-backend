class RemoveDescriptionFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :description
  end
end
