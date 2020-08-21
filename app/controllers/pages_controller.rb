class PagesController < ApplicationController

  def index
    # notifier = Slack::Notifier.new('https://hooks.slack.com/services/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') #事前準備で取得したWebhook URL
    # attachments = {
    #   fallback: "This is 俺",
    #   title: "俺",
    #   text: "<@U013RQ74ZLZ> おい、元気",
    #   color: 'good'
    # }
    # notifier.post text: "俺が記事を更新しました！", attachments: attachments

  end

end
