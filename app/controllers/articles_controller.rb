class ArticlesController < ApplicationController
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, :notice => 'Article created with success!'
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article, :notice => 'Article updated with success!'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path, :notice => 'Article deleted with success!'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :subtitle, :tag_list, :image)
  end
end
