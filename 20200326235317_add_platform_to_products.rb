class AddPlatformToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :platform, :string, limit: 200
  end
end
