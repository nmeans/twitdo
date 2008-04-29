class AddTweetTimeToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :tweet_time, :timestamp
  end

  def self.down
    remove_column :todos, :tweet_time
  end
end
