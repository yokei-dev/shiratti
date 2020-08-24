class AddChannelToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :channel, :string
  end
end
