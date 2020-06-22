class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :images, null: false
      t.references :item, type: :bigint, null: false
      t.timestamps
    end
    add_foreign_key :images, :items
  end
end
