class RenameNameColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :name, :image
 
  end
end
