class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: "タグを削除しました" }
      format.json { head :no_content }
    end
  end

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.valid?(:title) && @tag.save
        format.html { redirect_to tags_path, notice: "タグを作成しました。" }
      else
        flash.now[:alert] = 'タグ名が空欄か既に登録済みです。'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: "タグを更新しました。" }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:title)
    end
end
