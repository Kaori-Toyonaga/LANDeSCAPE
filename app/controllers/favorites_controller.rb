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
  end


end
