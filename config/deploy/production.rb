set :stage, :production
set :branch, 'master' ## 必要があれば変更

role :app, %w{nattu@118.27.9.161 } ###変更
role :web, %w{nattu@118.27.9.161 } ###
role :db, %w{nattu@118.27.9.161 }  ###

set :ssh_options, {
  port: 6183, #### 変更
  keys: [File.expand_path('~/.ssh/insecure_private_key')],
  forward_agent: true,
  auth_methods: %w(publickey)
}
