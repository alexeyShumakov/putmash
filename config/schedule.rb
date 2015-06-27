# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
env :PATH, ENV['PATH']
# set :environment, "development"
# Learn more: http://github.com/javan/whenever

# every 1.day, at: '12:01 am' do
# 	runner "CurrencyWorker.perform_async"
# end
# every :day, :at => '12:10 am' do
# 	runner "CurrencyWorker.perform_async"
# end

every 1.day, at: '6:01 am' do
  rake "currency_worker:get", :output => 'log/cron.log'
end

