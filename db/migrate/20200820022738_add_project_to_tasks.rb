class AddProjectToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :project, foreign_key: {to_table: :projects}
  end
end
