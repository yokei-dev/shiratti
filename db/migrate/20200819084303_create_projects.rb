class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.references :boss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
