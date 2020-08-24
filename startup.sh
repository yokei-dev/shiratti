# cronをフォアグラウンド実行
CMD ["cron", "-f"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]