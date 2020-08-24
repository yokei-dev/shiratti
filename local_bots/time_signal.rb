require "slack"

Slack.configure do |config|
  config.token = 'xoxb-518476454566-1303524832343-f5gxN43xT0XuPvuMEvXBMze0'
end

# text = case Time.now.hour
# when Time.now.hour then '10時: 今日も頑張りましょう'
# end

@projects = Project.all.each do |project|
  text = project.members
Slack.chat_postMessage(text: text, channel: 'higedameshi')
end
