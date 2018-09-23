set :stage, :production
set :branch, 'master' ## 必要があれば変更

server '118.27.9.161', user: 'nattu', roles: %w{app db web}, port: 5467

#デプロイするサーバーにsshログインする鍵の情報。
#サーバー編で作成した鍵のパス
set :ssh_options, {
  port: 5467,
  # capistranoコマンド実行者の秘密鍵
  keys: %w('~/.ssh/conoha3/id_rsa'),
  forward_agent: true,
  auth_methods: %w(publickey)
}
