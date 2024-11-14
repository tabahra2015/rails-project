class CreateDataReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :data_reviews do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
