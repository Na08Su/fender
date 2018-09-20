# 共通の設定をconfig/deploy.rbで記述

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "fender"
set :repo_url, "git@github.com:NatsukiSugawara/fender.git" # デプロイ対象のリポジトリ
set :deploy_to, '/var/www/app/fender'

set :branch, 'master' # ブランチを指定
# set :scm, :git
set :deploy_via, :remote_cache


set :log_level, :debug # 出力の制御
set :pty, true # sudoを使用するのに必要
set :bundle_binstubs, nil

# capistrano用でbundleするのに必要
# set :default_env, { path: "/home/nattu/.rbenv"}


# Shared に入るものを指定
set :linked_files, %w{config/database.yml config/secrets.yml} # シンボリックリンクを貼るファイル
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets} # sharedにシンボリックリンクを張るディレクトリ指定

# Unicorn
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"


set :keep_releases, 5
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  # http://morizyun.github.io/blog/meta-tags-sitemap-generator-rails-seo/
  # desc "古いサイトマップの削除"
  # task :copy_old_sitemap do
  #   run "if [ -e #{previous_release}/public/sitemap_index.xml.gz ]; then cp #{previous_release}/public/sitemap* #{current_release}/public/; fi"
  # end
  # desc "sitemapの更新"
  # task :refresh_sitemaps do
  #   run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
  # end

 desc 'Restart application'
  # アプリ再起動を行うタスク
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path.join('tmp')
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  # linked_files で使用するファイルをアップロードするタスク
  # deployが行われる前に実行する必要がある。
  desc 'upload important files'
  task :upload do
    # binding.pry
    on roles(:app) do |host|
      execute :mkdir, '-p', "#{shared_path}/config"
      upload!('config/database.yml',"#{shared_path}/config/database.yml")
      upload!('config/secrets.yml',"#{shared_path}/config/secrets.yml")
    end
  end

  # webサーバー再起動時にキャッシュを削除する
  after :restart, :clear_cache do
   on roles(:web), in: :groups, limit: 3, wait: 10 do
    #Here we can do anything such as:
    within release_path do
      execute :rm, '-rf', release_path.join('tmp/cache')
    end
   end
  end
  # Flow の before, after のタイミングで上記タスクを実行
  before :started,   'deploy:upload'
  after  :finishing, 'deploy:cleanup'

  #unicorn 再起動タスク
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart' # lib/capustrano/tasks/unicorn.cap 内処理を実行
  end
end
