# README
あとで読む
ゲームメディア
https://www.stockclip.net/notes/677

キューレーションメディア一覧まとめ
https://matome.naver.jp/odai/2141243734479187601

## 主要モデル

### Article
# モデル

Article (コンテンツ記事)

  ・title
  ・img(s3)
  ・body
  ・author_id(執筆者 = admin_user_id)
  ・記事の階級(topに表示するなどの切り分け方法を考える)
      - フラグを持たせる(checkboxタイプ)

  ・タグ
  ・(カテゴリ)

  - 文書の整形をしやすくする（細かいレイアウトが可能）
  - 検索機能(ransack)
  - ページネーション
  - 画像



## activeadminからスタートする
→ userモデルは現状不要

* Ruby version
   2.5.1

* System dependencies(予定)
  CentOs6.8 + MySQL + Nginx + Unicorn + capistrano

* Configuration

* Database creation
現状SQLiteだが最終的にはMysqL

* Database initialization

* How to run the test suite
  開発速度を優先するため、現状なし

* Services (job queues, cache servers, search engines, etc.)


* Deployment instructions


# ハードル
  0. ドメイン取得                 done
  1. 本番サーバーの比較検討(CONOHA) done
  2. SSLを行うか
  3. SEO対策
  4. 誰でも管理しやすくする(admin)← ckeditorを導入したため、ほぼクリア done
  5. 広告の設定
  6. １記事につき、複数画像の投稿、レイアウト← ckeditorを導入したため、ほぼクリア done


# AWS 設定
 https://gootablog.com/aws-s3-create
