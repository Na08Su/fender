# capistranoの基本動作を設定
require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rvm'


require "capistrano/rbenv"
set :rbenv_type, :user #rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '2.5.1'

set :rbenv_custom_path, '/home/nattu/.rbenv'
# リモートサーバーで$ rbenv version
# 2.5.1 (set by /home/nattu/.rbenv/version)に基づく

require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
