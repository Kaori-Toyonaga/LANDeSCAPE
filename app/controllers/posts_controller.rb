class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:index]

  def index
    @posts = Post.all
    @posts = @posts.search_prefecture(params[:prefecture]) if params[:prefecture].present? && params[:prefecture] != "都道府県"
    @posts = @posts.search_spotname(params[:spotname]) if params[:spotname].present?
    # @posts = @posts.search_tag(params[:tag_id]) if params[:tag_id].present?
    @posts = @posts.joins(:tags).where(tags: { id: params[:tag_id] }) if params[:tag_id].present?
    @posts = @posts.order('updated_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
     render :new
    else
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました!"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:image, :image_cache, :spotname, :prefecture, :address, :url, :date, :content, :user_id, tag_ids: [] )
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end

end
