class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content,	null: false, default:""
      t.datetime :deadline,	default:""
      t.integer :status,	default:""
      t.timestamps
    end
  end
end
