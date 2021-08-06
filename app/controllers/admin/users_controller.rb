class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :show, :destroy, :update]
  before_action :require_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.name}を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] =  "#{@user.name} の情報を更新しました"
      redirect_to admin_users_path
    else
      render :edit, notice: "#{@user.name} の管理者権限を外すと管理者がいなくなります"
    end
  end

  def show
  end

  def index
    @users = User.all.includes(:posts)
  end

  def destroy
    if@user.destroy
      redirect_to admin_users_path, notice: "#{@user.name} を削除しました"
    else
      redirect_to admin_users_path, notice: "#{@user.name} を削除すると管理者がいなくなります"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    unless current_user.admin?
      redirect_to posts_path, notice: "不正なアクセスです。"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
