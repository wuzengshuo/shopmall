class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 100
      t.integer :number
      t.string :description
      t.boolean :on_shelf
      t.decimal :price, precision: 14, scale: 4
      t.integer :product_category_id

      t.timestamps
    end
    add_index :products, :product_category_id
  end
end
