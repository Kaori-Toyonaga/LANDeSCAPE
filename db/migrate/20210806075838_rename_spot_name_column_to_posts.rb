class RenameSpotNameColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :spot_name, :spotname
  end
end
