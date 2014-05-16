# Use this file to easily define all of your cron jobs.
# Learn more: http://github.com/javan/whenever

set :output, "log/average_load.log"

every 1.minutes do
  rake "check"
end