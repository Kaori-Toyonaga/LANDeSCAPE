class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :spot_name
      t.string :prefecture
      t.text :address
      t.text :url
      t.date :date
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
