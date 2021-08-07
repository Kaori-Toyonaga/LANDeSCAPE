class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show]
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = "prof.png"
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ユーザーを登録しました'
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: current_user.id).all
    if @user != current_user
      redirect_to user_path(current_user), alert: "このページへのアクセスはできません。"
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "このページへのアクセスはできません。"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit, alert: "氏名もしくはアドレスが空欄です。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:image, :image_cache, :name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
