class SessionsController < ApplicationController
  def new
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
    else
      flash.now[:danger] = 'Login failed'
      render :new
    end
  end
end
