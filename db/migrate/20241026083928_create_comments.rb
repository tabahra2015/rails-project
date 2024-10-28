class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user
      t.integer :rating
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
