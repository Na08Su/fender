set :stage, :production
set :branch, 'master' ## 必要があれば変更

# role :app, %w{nattu@118.27.9.161 }
# role :web, %w{nattu@118.27.9.161 }
# role :db, %w{nattu@118.27.9.161 }

server '118.27.9.161', user: 'nattu', roles: %w{app db web}, port: 6183

#デプロイするサーバーにsshログインする鍵の情報。サーバー編で作成した鍵のパス
set :ssh_options, keys: '~/.ssh/github/id_rsa'
# set :ssh_options, {
#   port: 6183,
#   keys: [File.expand_path('~/.ssh/github/id_rsa')],
#   forward_agent: true,
#   auth_methods: %w(publickey)
# }
