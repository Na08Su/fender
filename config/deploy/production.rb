set :stage, :production
set :branch, 'master' ## 必要があれば変更

role :app, %w{root@118.27.9.161 } ###変更
role :web, %w{root@118.27.9.161 } ###
role :db, %w{root@118.27.9.161 }  ###

set :ssh_options, {
  port: 6183, #### 変更
  keys: [File.expand_path('~/.ssh/github/id_rsa')],
  forward_agent: true,
  auth_methods: %w(publickey)
}
