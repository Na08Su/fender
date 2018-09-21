# -*- coding: utf-8 -*-
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true # 更新時ダウンタイム無し

app_path = '/var/www/app/fender/current' #### 変更 試しにcurrent外してみる

working_directory "#{app_path}"

app_shared_path = "#{app_path}/shared"

#エラー /var/www/app/fender/current/shared/tmp/pids/unicorn.pid not writable

# nginxと連携するための設定
listen "#{app_shared_path}/tmp/sockets/unicorn.sock" # tmpを追加してみた-> nginx.confも修正する必要あるかも

stdout_path "#{app_shared_path}/log/unicorn.stdout.log"
stderr_path "#{app_shared_path}/log/unicorn.stderr.log"

pid "#{app_shared_path}/tmp/pids/unicorn.pid"

# ログの出力
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

puts "-----------------------------------------------------------------"
puts "-------------メッシメッシメッシメッシメッシメッシメッシ-----------------"
puts "-----------------------------------------------------------------"

# unicorn:start
#       01 /home/nattu/.rbenv/bin/rbenv exec bundle exec unicorn -c /var/www/app/fender/current/config/unicorn/production.rb -E deployment -D
#       01 -----------------------------------------------------------------
#       01 -------------メッシメッシメッシメッシメッシメッシメッシ-----------------
#       01 -----------------------------------------------------------------
#       01 bundler: failed to load command: unicorn (/var/www/app/fender/shared/bundle/ruby/2.5.0/bin/unicorn)
#       01 ArgumentError: directory for pid=/var/www/app/fender/current/shared/tmp/pids/unicorn.pid not writable
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/configurator.rb:100:in `block in reload'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/configurator.rb:96:in `each'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/configurator.rb:96:in `reload'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/configurator.rb:77:in `initialize'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/http_server.rb:77:in `new'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/lib/unicorn/http_server.rb:77:in `initialize'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/bin/unicorn:126:in `new'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/gems/unicorn-5.4.1/bin/unicorn:126:in `<top (required)>'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/bin/unicorn:23:in `load'
#       01   /var/www/app/fender/shared/bundle/ruby/2.5.0/bin/unicorn:23:in `<top (required)>'
#       01 master failed to start, check stderr log for details
# #<Thread:0x00007f8501ad46b0@/Users/natsukisugawara/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/sshkit-1.17.0/lib/sshkit/runners/parallel.rb:10 run> terminated with exception (report_on_exception is true):
# Traceback (most recent call last):
# 	1: from /Users/natsukisugawara/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/sshkit-1.17.0/lib/sshkit/runners/parallel.rb:11:in `block (2 levels) in execute'
# /Users/natsukisugawara/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/sshkit-1.17.0/lib/sshkit/runners/parallel.rb:15:in `rescue in block (2 levels) in execute': Exception while executing as nattu@118.27.9.161: bundle exit status: 1 (SSHKit::Runner::ExecuteError)
#

# binding.pry

# before_exec do |server|
#   ENV['BUNDLE_GEMFILE'] = "#{ app_path }/Gemfile"
# end

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
