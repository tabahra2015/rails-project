class AddStatesToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :status, :integer
  end
end
