#https://capistranorb.com/documentation/getting-started/configuration/
# ↑capistranoの各設定詳細マニュアル

# capistranoの基本動作を設定
require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# rbenvの設定
require "capistrano/rbenv"
set :rbenv_type, :user   # rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '2.5.1' # サーバで利用するrubyのバージョンを指定
set :rbenv_custom_path, '/home/nattu/.rbenv'
# リモートサーバーで$ rbenv version
# 2.5.1 (set by /home/nattu/.rbenv/version)に基づく

# capistrano用でbundleするのに必要
# capで使う環境変数などを定義する
set :default_env, {
  rbenv_root: "#{fetch(:rbenv_custom_path)}",
  path: "#{fetch(:rbenv_custom_path)}/shims:#{fetch(:rbenv_custom_path)}/bin:$PATH",
  S3_ACCESS_KEY: ENV['S3_ACCESS_KEY'],
  S3_SECRET_KEY: ENV['S3_SECRET_KEY']
}
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

require "capistrano/bundler"
require 'capistrano3/unicorn'
require "capistrano/rails"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
