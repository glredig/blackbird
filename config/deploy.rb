# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "blackbird"
set :repo_url, "git@github.com:glredig/blackbird.git"

set :deploy_to, "/home/deploy/blackbird"
set :location, "ec2-13-112-228-85.ap-northeast-1.compute.amazonaws.com"

set :pty, true

set :linked_files, %w{config/database.yml config/application.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :keep_releases, 5
set :rbenv_path, '/home/deploy/.rbenv'

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
