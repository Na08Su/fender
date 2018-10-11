source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
gem 'bootstrap-sass', '3.3.7'

gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'


gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'

# http://blog.10rane.com/2015/03/30/i-annotate-model-of-activerecord/
gem 'annotate'#, require: false # モデルにschema情報を自動で追加してくれる

gem 'devise'       # ユーザー機能は使わないが、activeadmin依存のため利用
gem 'activeadmin'  # admin画面
# https://activeadmin.info/documentation.html
# https://rails-school.net/active-admin/
# https://qiita.com/haneri/items/d9d8d2dfa239a7f2461d

# 検索
gem 'ransack'

# スマホ用 デバイス判定
# https://github.com/jpmobile/jpmobile
gem 'jpmobile'

# タグ機能
# https://github.com/mbleigh/acts-as-taggable-on
# https://ruby-rails.hatenadiary.com/entry/20150225/1424858414
gem 'acts-as-taggable-on'

# 画像周り
gem 'carrierwave'
gem 'mini_magick'

### editor #####
# http://clc.gonna.jp/2017/05/activeadmin%E3%81%ABckeditor%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B/
gem 'ckeditor'

### SEO #####
gem "gretel" # パンくずリスト

gem 'meta-tags' # TODO
gem 'sitemap_generator' # TODO 要設定
# https://morizyun.github.io/blog/meta-tags-sitemap-generator-rails-seo/index.html


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false


#gem 'rb-readline' # gem 'capistrano-rails-console'で使うらしい

gem 'dotenv-rails' # 環境変数を管理する

# 投稿する文字列の中にリンクがあったらリンク化する
gem 'rails_autolink', '1.1.6'

# PV計上
gem 'impressionist'

# SEO
# https://qiita.com/tackeyy/items/077f7247309665592112
# http://vdeep.net/rubyonrails-sitemap-generator
gem 'sitemap_generator'
# 自動処理
gem 'whenever', require: false

# DBをdumpできる
# https://qiita.com/mogya/items/88cc46f77c5430c96ced
gem 'yaml_db'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  # rails consoleをirbではなくpryにしてくれる
  gem 'pry-rails'
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem "better_errors"
  gem "binding_of_caller"

  # viewファイル変更時に自動でヴラウザをロードしてくれる 作業効率化
  gem 'guard-livereload', require: false

  # パフォーマンス測定
  gem 'rack-mini-profiler', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #gem 'xray-rails' # viewの構造を表示 precompileでバグるため一旦保留 -> 読み込みの設定が必要
  # rake aborted!
# Sprockets::FileNotFound: couldn't find file 'xray' with type 'application/javascript'
# Checked in these paths:
#   /Users/natsukisugawara/


  # N+1問題の指摘をしてくれる
  # http://ruby-rails.hatenadiary.com/entry/20141109/1415522242
  gem "bullet"

  # デプロイ

  gem 'capistrano'
  gem 'capistrano-rails'
  # gem 'capistrano3-unicorn', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  #gem 'capistrano-rails-console', require: false # 手元の環境からデプロイ先のconsoleを使う  https://qiita.com/zaru/items/42953ac86df29043fda0
  # $ bundle exec cap staging rails:console
  #これでstagingサーバのrails consoleが起動するはず。手元でリモートサーバのコンソールいじれるので、ステージングサーバの確認とか、テストデータ挿入とか超便利。
  #gem 'capistrano-safe-deploy-to'
  #gem "capistrano-scm-copy"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  gem 'fog', '~> 1.41.0'
  gem 'unicorn'

  gem "google-analytics-rails"

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
