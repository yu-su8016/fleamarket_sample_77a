class FixItemAddId < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :condition, :string
    remove_column :items, :delivery_fee, :string
    remove_column :items, :prefecture, :string
    remove_column :items, :day, :string
    remove_column :items, :delivery_method, :string

    add_column :items, :condition_id, :integer, null: false
    add_column :items, :delivery_fee_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :day_id, :integer, null: false
    add_column :items, :delivery_method_id, :integer, null: false
  end
end
