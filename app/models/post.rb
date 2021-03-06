class Post < ApplicationRecord
  with_options presence:true do
    validates :image
    validates :spotname
    validates :prefecture
    validates :address, format: { with: /.*[市区町村]/ }
  end

  validates :content, length: { maximum: 200 }

  VALID_URL_REGEX = /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  validates :url, format: { with: VALID_URL_REGEX }

  validate :day_after_today
  def day_after_today
    unless date == nil
      errors.add(:date, 'は未来日は入力できません') if date > Date.today
    end
  end

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favnporites, source: :user

  has_many :tags_posts, dependent: :destroy#, foreign_key:'tag_id'
  has_many :tags, through: :tags_posts, source: :tag

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocodenize # :geocode

  enum prefecture:{
    都道府県: 0,
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20, 岐阜県: 21,
    静岡県: 22, 愛知県: 23, 三重県: 24, 滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28,
    奈良県: 29, 和歌山県: 30, 鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38 ,高知県: 39, 福岡県: 40, 佐賀県: 41, 長崎県: 42,
    熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47
  }

  scope :search_spotname, -> (spotname) { where("spotname LIKE ?", "%#{spotname}%") }
  scope :search_prefecture, -> (prefecture) { where(prefecture: prefecture) }

 def geocodenize
   if self.address.present?
     results =  Geocoder.coordinates(self.address)
     self.latitude = results[0]
     self.longitude = results[1]
   end
  end
end
