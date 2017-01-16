class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, :notice => 'Tag updated with success!'
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.taggings.destroy_all
    if @tag.destroy
      redirect_to tags_path, :notice => 'Tag deleted with success!'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
