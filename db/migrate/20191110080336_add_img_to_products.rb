class AddImgToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :img, :string, limit: 500
  end
end
