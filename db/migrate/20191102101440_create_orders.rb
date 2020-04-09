class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :code, limit: 100
      t.integer :product_id
      t.integer :number
      t.decimal :amount, precision: 14, scale: 4
      t.integer :user_id
      t.string :aasm_state, limit: 100

      t.timestamps
    end
    add_index :orders, :product_id
    add_index :orders, :user_id
  end
end
