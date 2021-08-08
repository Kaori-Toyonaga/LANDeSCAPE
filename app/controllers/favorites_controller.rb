class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "クリップに保存しました。"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "クリップを外しました。"
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).all
    # @favorites = @favorites.search_prefecture(params[:prefecture]) if params[:prefecture].present? && params[:prefecture] != "都道府県"
    # @favorites = @favorites.search_spotname(params[:spotname]) if params[:spotname].present?
    # @favorites = @favorites.joins(:tags).where(tags: { id: params[:tag_id] }) if params[:tag_id].present?
    # @favorites = @favorites.order('updated_at DESC')
  end

end
