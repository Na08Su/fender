# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rbenv"
set :rbenv_type, :system #rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '2.5.1'
set :rbenv_custom_path, '/usr/local/rbenv/'

require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
