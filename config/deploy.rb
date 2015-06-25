set :application, 'putmash'
set :repo_url, 'https://github.com/alexeyShumakov/putmash.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/alexey/putmash'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true
set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
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
  task :update_crontab do
    desc 'Update crontab'
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
  task :restart do
    desc "Restart Unicorn"
    on roles(:all) do
      sudo "/etc/init.d/unicorn stop"
      sudo "/etc/init.d/unicorn start"
      # execute :bundle, "whenever --update-crontab #{fetch(:application)}"
    end
  end

  after "deploy:restart", "deploy:update_crontab"
end