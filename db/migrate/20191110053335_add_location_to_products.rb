class AddLocationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :location, :string, limit: 500
  end
end
