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
