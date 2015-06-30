set :application, 'putmash'
set :repo_url, 'https://github.com/alexeyShumakov/putmash.git'


set :deploy_to, '/home/alexey/putmash'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true
set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
set :unicorn_config_path, 'config/unicorn.rb'

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :keep_releases, 5

namespace :deploy do
  task :setup do
    before "deploy:migrate", :create_db
    invoke :deploy
  end
  task :create_db do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:drop"
          execute :rake, "db:create"
        end
      end
    end
  end

  task :restart do
    invoke 'unicorn:legacy_restart'
  end

  after 'deploy:publishing', 'deploy:restart'
end