class AddProjectIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :project, null: false, foreign_key: true
  end
end
