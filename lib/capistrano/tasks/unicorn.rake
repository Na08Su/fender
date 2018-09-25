namespace :unicorn do
  task :environment do
    # shared_path = "/var/www/fender/shared"
    # current_path = "/var/www/fender/current"
    set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/config/unicorn/production.rb"
  end

  def start_unicorn
    # フォルダが存在した場合のみ実行する
    within current_path do
    execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  def stop_unicorn
    execute :kill, "-s QUIT $(< #{fetch(:unicorn_pid)})"
  end

  def reload_unicorn
    # バグる
    puts "---------------------"
    puts ".......skipします....."
    puts "---------------------"

    execute :kill, "-s USR2 $(< #{fetch(:unicorn_pid)})" # TODO
  end

  def force_stop_unicorn
    execute :kill, "$(< #{fetch(:unicorn_pid)})"
  end

  desc "Start unicorn server"
  task :start => :environment do
    on roles(:app) do
      start_unicorn
    end
  end

  desc "Stop unicorn server gracefully"
  task :stop => :environment do
    on roles(:app) do
      stop_unicorn
    end
  end

  desc "Restart unicorn server gracefully"
  task :restart => :environment do # TODO
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        puts "reloadできるのかなあ〜〜〜〜〜〜〜〜"
        reload_unicorn
        puts "reloadできないよ〜〜〜〜〜〜〜〜"
      else
        start_unicorn
      end
    end
  end

  desc "Stop unicorn server immediately"
  task :force_stop => :environment do # TODO
    on roles(:app) do
      force_stop_unicorn
    end
  end
end