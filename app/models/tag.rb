class Tag < ApplicationRecord
  has_many :tags_posts, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :tags_posts, source: :post

  validates :title, uniqueness: true

  with_options presence: true do
    validates :title
  end
end
