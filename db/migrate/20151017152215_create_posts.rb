class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.text :link
      t.integer :votes

      t.timestamps null: false
    end
  end
end
