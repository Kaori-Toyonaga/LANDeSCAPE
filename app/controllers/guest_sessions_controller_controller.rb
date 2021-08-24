class GuestSessionsControllerController < ApplicationController

  def create
    user = User.find_or_create_by(email: "test@test.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
  end
    session[:user_id] = user.id
    flash[:success] = "ゲストユーザーとしてログインしました"
    redirect_to posts_path
  end

end
