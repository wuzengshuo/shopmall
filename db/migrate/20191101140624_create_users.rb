class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :code
      t.string :name
      t.string :avatar
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
