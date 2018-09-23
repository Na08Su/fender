# TODO
# リモートのディレクトリ設定とnginxの設定を変更したので、確認すること


# -*- coding: utf-8 -*-
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 30

# ホットデプロイをするか？
preload_app true # 更新時ダウンタイム無し

app_path = '/var/www/fender/current' #変更
working_directory "#{app_path}"

#app_shared_path = "#{app_path}/shared"

#エラー /var/www/app/fender/current/shared/tmp/pids/unicorn.pid not writable

# nginxと連携するための設定
# リクエストを受け取る ポート番号を指定
listen "/var/www/fender/shared/sockets/unicorn.sock" # DONE!!
# PIDの管理ディレクトリ
pid "/var/www/fender/shared/sockets/unicorn.pid" #

stdout_path "#{app_path}/log/unicorn.log" # Done
stderr_path "#{app_path}/log/unicorn.log" # Done

#shared_path = "/var/www/app/fender/shared"



# ログの出力パス
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

puts "-------------メッシメッシメッシメッシメッシメッシメッシ-----------------"

# フォーク前に行うことを定義
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

# フォーク後に行うことを定義
after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
