class ArticlesController < ApplicationController
  def index
    @articles = Article.all.sort_by(&:created_at).reverse
    # @articles = @articles.sort_by(&:created_at).reverse
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(clean_article)

    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(clean_article)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def clean_article
    params.require(:article).permit(:title, :content)
  end
end
