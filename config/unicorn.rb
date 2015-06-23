worker_processes 2


working_directory "/home/alexey/putmash/current" # available in 0.94.0+

# we use a shorter backlog for quicker failover when busy
listen "/tmp/northline.unicorn.sock", :backlog => 64
listen 8080, :tcp_nopush => true
# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# feel free to point this anywhere accessible on the filesystem
pid "/home/alexey/putmash/current/tmp/pids/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path "/home/alexey/putmash/shared/log/unicorn.stderr.log"
stdout_path "/home/alexey/putmash/shared/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
		GC.copy_on_write_friendly = true

check_client_connection false

# local variable to guard against running a hook multiple times
run_once = true

before_fork do |server, worker|
	# the following is highly recomended for Rails + "preload_app true"
	# as there's no need for the master process to hold a connection
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.connection.disconnect!

	# Occasionally, it may be necessary to run non-idempotent code in the
	# master before forking.  Keep in mind the above disconnect! example
	# is idempotent and does not need a guard.
	if run_once
		# do_something_once_here ...
		run_once = false # prevent from firing again
	end

end

after_fork do |server, worker|
	# per-process listener ports for debugging/admin/migrations
	# addr = "127.0.0.1:#{9293 + worker.nr}"
	# server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)

	# the following is *required* for Rails + "preload_app true",
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.establish_connection

end
