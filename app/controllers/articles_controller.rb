class ArticlesController < ApplicationController
  def index
    if Rails.env == "development"
      @text = "ATOM遅いなあああああ"
      # @debug = @q.result.to_sql
    end

    @articles = Article.all
    @article_last1  = Article.last
    @article_last2 = Article.last(2)[0]

    @article_youtube = Article.first # 動画記事


    @osusume_articles = Article.last(5) # おすすめのロジック
    @ranking_articles = Article.last(5) # ランキングのロジック

    @categories = Category.all

  end

  def show
    @article = Article.find(params[:id])

    @osusume_articles = Article.last(5) # おすすめのロジック
    @ranking_articles = Article.last(5) # ランキングのロジック

  end
end
