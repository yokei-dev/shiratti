class AddCommentToDailyTask < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_tasks, :comment, :string
  end
end
