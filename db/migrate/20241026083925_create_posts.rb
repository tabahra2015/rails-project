class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author
      t.datetime :published_at
      t.integer :views

      t.timestamps
    end
  end
end
