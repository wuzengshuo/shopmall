class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :title, limit: 50
      t.integer :sorting

      t.timestamps
    end
  end
end
