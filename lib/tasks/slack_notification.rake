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
    mention = false
    @projects = Project.all.each do |project|
      a = Array.new(2)
      project.members.each do |member|
        a[0] = member.name
        if member.daily_users.last.present?
          a[1] = member.daily_users.last.face
          #____顔が1点ならmentionいく
          if member.daily_users.last.face == "😱" or member.daily_users.last.face == "😢"
            mention = true
          end
          #____
          #____顔が2点以下3回あったらmentionいく
          # if member.daily_users.last(3).face == "😑" and 

          # end
          #____
        end
      end
      text = a
      # binding.pry
      # Slack.chat_postMessage(text: 'おい',channel: 'higedameshi')
      Slack.chat_postMessage(text: text.to_json, channel: 'higedameshi')
      #_____追加
      if mention
        user_id = "U013RQ74ZLZ"
        Slack.chat_postMessage(text: "<@#{user_id}>", channel: 'higedameshi')
      end
      #_____
    end
    
        
  end
end