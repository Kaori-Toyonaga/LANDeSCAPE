class Post < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :spot_name
    validates :prefecture
    validates :address
  end
end
