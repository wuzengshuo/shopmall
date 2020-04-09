class AddBankCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :bank_code, :string, limit: 200
    add_column :orders, :cv_code, :string, limit: 200
  end
end
