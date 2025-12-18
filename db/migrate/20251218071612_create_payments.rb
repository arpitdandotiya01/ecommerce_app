class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.string :type, null: false
      t.references :order, null: false, foreign_key: true
      t.decimal :amount
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :payments, :type
  end
end
