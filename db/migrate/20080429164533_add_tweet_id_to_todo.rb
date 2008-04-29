class AddTweetIdToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :tweet_id, :integer
  end

  def self.down
    remove_column :todos, :tweet_id
  end
end
