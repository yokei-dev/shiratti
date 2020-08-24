class AddFaceToDailyUser < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_users, :face, :string
  end
end
