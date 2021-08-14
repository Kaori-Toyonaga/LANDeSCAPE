class ChangeDatatypeAdressOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :address, :string
  end
end
