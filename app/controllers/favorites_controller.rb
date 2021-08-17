class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    favorites = current_user.favorites.find_by(post_id: @post).destroy
    redirect_to post_path(@post)
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @posts = Post.where(id: @favorites.map(&:post_id))
    @posts = @posts.search_prefecture(params[:prefecture]) if params[:prefecture].present? && params[:prefecture] != "都道府県"
    @posts = @posts.search_spotname(params[:spotname]) if params[:spotname].present?
    @favorites = Favorite.where(post_id: @posts.map(&:id), user_id: current_user.id).order('updated_at DESC')

    # [1, 2, 3].each do |a|
    # end
    # result = Favorite.all.map do |a|
    #   a.post_id
    # end
    # result = Favorite.all.map { |a| a.post_id }
    # result = Favorite.all.map(&:post_id)

    # @favorites = @favorites.search_prefecture(params[:prefecture]) if params[:prefecture].present? && params[:prefecture] != "都道府県"
    # @favorites = @favorites.search_spotname(params[:spotname]) if params[:spotname].present?
    # @favorites = @favorites.joins(:tags).where(tags: { id: params[:tag_id] }) if params[:tag_id].present?
  end

end
