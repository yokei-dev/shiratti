# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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

# Learn more: http://github.com/javan/whenever

ENV.each { |k, v| env(k, v) } # 環境変数をwheneverにいい感じに書き込んでもらう
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log' # ログを書き出すようにしておくとデバッグが楽
set :environment, :development

every 1.minute do
  rake 'slack_notification:post'
end

