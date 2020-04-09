class AddContactToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :contact, :string, limit: 100
  end
end
