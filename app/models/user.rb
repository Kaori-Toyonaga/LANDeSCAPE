class User < ApplicationRecord

  before_destroy :admin_user_destroy_action
  before_update :admin_user_update_action

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8 }
  
  before_validation { email.downcase! }
  has_secure_password

  has_many :posts
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader

  private
  def admin_user_destroy_action
    if User.where(admin: true).count == 1 && self.admin
      throw(:abort)
    end
  end

  def admin_user_update_action
    @admin_user = User.where(admin: true)
    if (@admin_user.count == 1 && @admin_user.first == self) && !(self.admin)
      throw :abort
    end
  end

end
