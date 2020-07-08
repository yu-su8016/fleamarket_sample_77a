class RenameImagesColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :images, :image
  end
end
