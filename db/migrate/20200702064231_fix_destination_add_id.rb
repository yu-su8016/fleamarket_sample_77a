class FixDestinationAddId < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :prefecture, :string

    add_column :destinations, :prefecture_id, :integer, null: false
  end
end
