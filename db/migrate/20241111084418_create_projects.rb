class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :deadline  # Add deadline column

      t.timestamps
    end
  end
end