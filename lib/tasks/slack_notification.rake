require "slack"
require "logger"

namespace :slack_notification do
  task :post => :environment do
    Rails.logger.info('実行する')
    Slack.configure do |config|
      config.token = 'xoxb-518476454566-1303524832343-f5gxN43xT0XuPvuMEvXBMze0'
    end
        
    # text = case Time.now.hour
    # when Time.now.hour then '10時: 今日も頑張りましょう'
    # end
        
    @projects = Project.all.each do |project|
      user_id = "U013RQ74ZLZ"
      Slack.chat_postMessage(text: "<@#{user_id}>", channel: 'higedameshi')
      a = Array.new(2)
      project.members.each do |member|
        a[0] = member.name
        if member.daily_users.last.present?
          a[1] = member.daily_users.last.face
        end
      end
      text = a
      # binding.pry
      # Slack.chat_postMessage(text: 'おい',channel: 'higedameshi')
      Slack.chat_postMessage(text: text.to_json, channel: 'higedameshi')
    end
    
        
  end
end