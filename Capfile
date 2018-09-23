#https://capistranorb.com/documentation/getting-started/configuration/
# ↑capistranoの各設定詳細マニュアル

# capistranoの基本動作を設定
require "capistrano/setup"   # ok
require "capistrano/deploy"  # ok
require "capistrano/scm/git" # ok
install_plugin Capistrano::SCM::Git


require "capistrano/rails" # ok
require "capistrano/rails/assets" # ok
require "capistrano/rails/migrations" #ok
# rbenvの設定
require "capistrano/rbenv" #ok
require "capistrano/bundler"

# リモートサーバーで$ rbenv version
# 2.5.1 (set by /home/nattu/.rbenv/version)に基づく

# capistrano用でbundleするのに必要
# capで使う環境変数などを定義する
# set :default_env, {
#   rbenv_root: "#{fetch(:rbenv_custom_path)}",
#   path: "#{fetch(:rbenv_custom_path)}/shims:#{fetch(:rbenv_custom_path)}/bin:$PATH",
#   S3_ACCESS_KEY: ENV['S3_ACCESS_KEY'], # TODO  セキュリティ的にやばいらしい
#   S3_SECRET_KEY: ENV['S3_SECRET_KEY']  # TODO
# }
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# require 'capistrano3/unicorn'


Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
