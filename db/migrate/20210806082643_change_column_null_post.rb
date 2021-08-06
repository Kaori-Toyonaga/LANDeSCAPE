class ChangeColumnNullPost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :image, false
    change_column_null :posts, :spotname, false
    change_column_null :posts, :prefecture, false
  end
end
