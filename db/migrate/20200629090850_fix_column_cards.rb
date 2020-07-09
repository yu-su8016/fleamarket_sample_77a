class FixColumnCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :unmber, :string
    remove_column :cards, :limit_month, :string
    remove_column :cards, :limit_year, :string
    remove_column :cards, :security_code, :string
    add_column :cards, :customer_id, :string, null: false
  end
end
