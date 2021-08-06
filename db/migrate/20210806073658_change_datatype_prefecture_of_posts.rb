class ChangeDatatypePrefectureOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :prefecture, :integer, using: "prefecture::integer"   
  end
end
