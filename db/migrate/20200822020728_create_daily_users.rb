class CreateDailyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_users do |t|
      t.float :motivation
      t.references :user, null: false, foreign_key: true
      t.date :add_date

      t.timestamps
    end
  end
end
