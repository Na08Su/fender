class ArticlesController < ApplicationController
  # pvを取る
  # impressionist :actions=> [:show]

  def index
    # 暫定のもの　あとでカテゴリごとに最適かする

    @tags = ActsAsTaggableOn::Tag.most_used(30)

    @new_articles = Article.limit(100).order("created_at DESC")# 新着順のリスト

    # ピックアップ
    @articles = Article.all

    # pv順 現在はシンプルに合計pv数のみで抽出している
    @pv_articles = Article.order('impressions_count DESC').take(10)
      #日付で絞り込むなら以下のようにする
      # .where("? <= created_at", Time.now.yesterday)
      # .where("created_at <= ?", Time.now)

    @article_last1  = Article.last
    @article_last2 = Article.last(2)[0]

    @article_youtube = Article.first # 動画記事


    @osusume_articles = Article.last(5) # おすすめのロジック
    # @ranking_articles = Article.last(5) # ランキングのロジック

    @categories = Category.all

  end

  def show

    @article = Article.find(params[:id])
    @related_article = Article.all

    @osusume_articles = Article.last(5) # おすすめのロジック
    @ranking_articles = Article.last(5) # ランキングのロジック

    # 1記事に対して何人が見たのか
    impressionist(@article, nil, unique: [:session_hash])

  end

  def search_page

    @q = Article.search(search_params)
    @search_articles = @q.result#.page(params[:page]).per(30).order(created_at: :desc)#.eager_load(:taggings)

    @name = params[:q][:body_cont]
  end

  def related_tags
    # binding.pry
    @name = params[:format]
    @tags = Article.tagged_with(params[:format])
    # @tags
  end

private

  def search_params
    return {} if params[:q].blank?
    params.require(:q).permit(:title_cont,
                              :body_cont
                              )
  end

end
