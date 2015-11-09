class DropVotes < ActiveRecord::Migration
  def up
    drop_table :votes
  end
end
