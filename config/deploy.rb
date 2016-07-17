def ssh_exec(command)
  app_server = roles(:app).first
  port = app_server.port || 22

  exec %(ssh #{app_server.user}@#{app_server.hostname} -p #{port} -t "cd #{current_path} && #{command}")
end

set :application, 'ltst-RG'
set :repo_url, 'git@git.ltst.su:a.mironenko/robert_greenfield.git'
set :deploy_to, "/var/www/#{fetch(:stage)}-#{fetch(:application)}"

set :rvm_custom_path, '/usr/local/rvm'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

linked_files = %w(config/application.yml)
#linked_files << 'config/newrelic.yml' if fetch(:stage) == :production

set :linked_files, linked_files
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/app)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rails_env, fetch(:stage)

set :keep_releases, 10

# set :rbenv_type, :user
# set :rbenv_ruby, '2.1.0'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all
set :rvm_type, :user
set :rvm_ruby_version, '2.2.2'

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rails_env, 'production')
set :puma_threads, [1, 6]
set :puma_workers, 2
set :puma_init_active_record, false
set :puma_preload_app, false

# before 'deploy:check', 'puma:check'
# after :publishing, 'puma:restart'

desc 'Setup initial environment'
task :setup do
  on roles(:app), in: :sequence, wait: 5 do
    execute :mkdir, '-pv', shared_path.join('config')

    upload! StringIO.new(File.read('config/application.example.yml')), shared_path.join('config/application.yml')
  end
end

desc 'Log last 500 lines'
task :log do
  on roles(:app) do
    execute :tail, '-500', shared_path.join('log/production.log')
  end
end

task :console do
  command = []
  command << "#{fetch(:rvm_path)}/bin/rvm #{fetch(:rvm_ruby_version)} do"
  # command << "#{fetch(:rbenv_prefix)}"
  command << "bundle exec rails console #{fetch(:rails_env)}"

  ssh_exec command.join(' ')
end

require 'capistrano-db-tasks'

# if you haven't already specified
set :rails_env, 'production'

# if you want to remove the local dump file after loading
set :db_local_clean, true

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, false

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
set :assets_dir, %w(public/uploads)
set :local_assets_dir, %w(public/uploads)

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
set :locals_rails_env, 'production'

# DelayedJob
set :delayed_job_workers, 2
