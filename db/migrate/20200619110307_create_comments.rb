class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :user, type: :bigint, null: false
      t.references :item, type: :bigint, null: false
      t.timestamps
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :items
  end
end
