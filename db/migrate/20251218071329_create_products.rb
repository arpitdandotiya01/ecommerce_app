class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock, default: 0
      t.boolean :active, default: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  
    add_index :products, :active
    add_index :products, :price
  end
end
