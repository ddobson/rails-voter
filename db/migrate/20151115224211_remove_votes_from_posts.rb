class RemoveVotesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :votes, :integer
  end
end
