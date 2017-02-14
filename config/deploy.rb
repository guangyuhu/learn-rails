# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "learn-rails"
set :repo_url, "https://github.com/guangyuhu/learn-rails.git"

task :kill_thin do
  on "root@178.62.7.77" do
    if pid = `ps -ef | grep thin | grep -v grep | sort -r | sed -n 2p | awk '{print $2}'`
      puts "=> Killing existing server with pid #{pid}"
      `kill -9 #{pid}`
    end
  end
end

after 'deploy:publishing', 'kill_thin'
after 'kill_thin', 'thin:start'

# Define all the tasks that need to be running manually after Capistrano is finished.

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
