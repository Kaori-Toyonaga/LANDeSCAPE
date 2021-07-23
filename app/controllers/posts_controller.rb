class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to new_post_path
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:image, :spot_name, :prefecture, :address, :url, :date, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
