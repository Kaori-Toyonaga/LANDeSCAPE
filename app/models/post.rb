class Post < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :spot_name
    validates :prefecture
    validates :address
  end

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :tags_posts, dependent: :destroy, foreign_key: 'tag_id'
  has_many :tags, through: :tags_posts, source: :tag

end
