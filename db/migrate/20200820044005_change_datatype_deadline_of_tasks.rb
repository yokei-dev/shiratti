class ChangeDatatypeDeadlineOfTasks < ActiveRecord::Migration[6.0]
  def change
  	change_column :tasks, :deadline, :date, default:""
  end
end
