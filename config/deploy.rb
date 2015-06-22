set :application, 'putmash'
set :repo_url, 'https://github.com/alexeyShumakov/putmash.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/alexey/putmash'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true
# set :rvm_type, :system
set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
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
		on roles(:all) do
			run "#{sudo} /etc/init.d/unicorn restart"
		end
	end
end