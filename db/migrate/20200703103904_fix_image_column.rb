class FixImageColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :images, :string
    add_column :images, :image, :string, null: false 
  end
end
