class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)
    @article.generate_hash
    @article.save
    redirect_to edit_article_path(@article, key: @article.hash_key)
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
    @article = Article.find_by(id: params[:id], hash_key: params[:key])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    render "articles/update_confirmation"
  end

  def destroy
    Article.find(params[:id]).destroy
    render "articles/delete_confirmation"
  end


 private

  def article_params
    params.require(:article).permit(:title, :body, :contact, :price, :category_id, :location)
  end

end
