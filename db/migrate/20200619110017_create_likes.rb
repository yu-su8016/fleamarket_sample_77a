class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, type: :bigint, null: false
      t.references :item, type: :bigint, null: false
      t.timestamps
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :items
  end
end
