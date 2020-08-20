class ChangeColumnStatusToTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :status, from: '', to: 0
  end
end
