require "slack"
require "logger"

namespace :slack_notification do
  task :post => :environment do
    # Rails.logger.info('実行する') #slack_api用
    # Slack.configure do |config|
    #   config.token = ENV['SLACK_TOKEN']
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
          if member.daily_users.last(3).length >= 3
            if member.daily_users.last(3)[0].face == "😑" and member.daily_users.last(3)[0].face == "😑" and member.daily_users.last(3)[0].face == "😑"  
              mention = true
            end
          end
           #____
          end
        end
       text = a
      #  URL = project.channel
      URL = "https://hooks.slack.com/services/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"
       notifier = Slack::Notifier.new(URL)

      attachments = {
        author_name: "halleruya",
        text: text.to_json,
        color: "good",
        footer: "今日は晴れましたか"
      }
      notifier.post attachments: [attachments]

       #_____追加
       if mention
         user_id = User.find_by(id: project.boss_id).name
         notifier = Slack::Notifier.new(URL)
        notifier.ping "<@#{user_id}>"
       end
       #_____
       binding.pry
     end

        
  end
end