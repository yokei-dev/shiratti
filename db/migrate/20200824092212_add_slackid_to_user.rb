class AddSlackidToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slackid, :string
  end
end
