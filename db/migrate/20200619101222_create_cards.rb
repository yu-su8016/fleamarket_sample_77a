class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :unmber,         null: false
      t.string :limit,          null: false
      t.string :security_code,  null: false
      t.references :user, type: :bigint, null: false
      t.timestamps
    end
    add_foreign_key :cards, :users
  end
end
