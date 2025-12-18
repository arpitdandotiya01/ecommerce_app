class AddUserForeignKeys < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :carts, :users
    add_foreign_key :orders, :users
  end
end
