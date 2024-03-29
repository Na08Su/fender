# 共通の設定をconfig/deploy.rbで記述

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

# 基本設定
set :application, "fender"
set :repo_url, "https://NatsukiSugawara:snsn0803@github.com/NatsukiSugawara/fender.git"
# set :repo_url, "git@github.com:NatsukiSugawara/fender.git" # デプロイ対象のリポジトリ
set :deploy_to, '/var/www/fender' # デプロイ先

set :rbenv_type, :user  # rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '2.5.1' # サーバで利用するrubyのバージョンを指定
set :rbenv_path, '/home/nattu/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# リリースフォルダをいくつまで保持するか？
set :keep_releases, 5
set :deploy_via, :remote_cache

set :log_level, :debug # capistranoの出力ログの制御
set :pty, true # sudoを使用するのに必要

# bundleインストール設定
#set :bundle_binstubs, nil

# Shared に入るものを指定
set :linked_files, %w{config/database.yml config/secrets.yml} # シンボリックリンクを貼るファイル ->デプロイ対象としたくないファイルを記載
set :linked_dirs,  %w{bin log tmp/pids tmp/sockets tmp/cache vender/bundle public/uploads} # sharedにシンボリックリンクを張るディレクトリ指定-> デプロイ対象としたくないディレクトリを記載
# shared/systemではなく、shared/public/systemが作成されるようになります

# Unicorn
# set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"


after 'deploy:restart', 'deploy:sitemap'
namespace :deploy do

  desc 'Generate sitemap'
  task :sitemap do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :rake, 'sitemap:refresh RAILS_ENV=production'
      end
    end
  end

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
    on roles(:app) do |host|
      execute :mkdir, '-p', "#{shared_path}/config"
      upload!('config/database.yml',"#{shared_path}/config/database.yml")
      upload!('config/secrets.yml',"#{shared_path}/config/secrets.yml")
      # upload!('.env.production',"#{current_path}/.env.production") # 一時退避

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
