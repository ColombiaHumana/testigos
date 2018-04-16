# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"
set :application, "testigos"
set :repo_url, "git@github.com:ColombiaHumana/testigos.git"
set :deploy_to, "/app"
set :ssh_options, verify_host_key: :secure
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/cache", "public/uploads")
set :rvm_type, :user
set :rvm_ruby_version, '2.5.0'
set :passenger_restart_with_touch, true
set :env_file, '.env'
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :path, ENV['PWD']
