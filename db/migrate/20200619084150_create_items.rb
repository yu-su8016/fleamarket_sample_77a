class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.text :explanation,        null: false
      t.string :brand
      t.string :condition,        null: false
      t.string :delivery_fee,     null: false
      t.string :prefecture,       null: false
      t.string :day,              null: false
      t.integer :price,           null: false
      t.string :size
      t.string :delivery_method,  null: false
      t.references :seller, type: :bigint, null: false 
      t.references :buyer, type: :bigint
      t.references :category, type: :bigint, null: false

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :brand
    add_index :items, :price

    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
    add_foreign_key :items, :categories
  end
end