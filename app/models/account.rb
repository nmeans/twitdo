class Account < ActiveRecord::Base
  has_many :todos, :order => "tweet_time DESC"
  
  def to_param
    "#{username}"
  end
  
  def twitter_link
    "http://twitter.com/#{username}"
  end
end
