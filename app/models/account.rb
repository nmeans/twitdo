class Account < ActiveRecord::Base
  has_many :todos, :order => "tweet_time DESC"
  
  def to_param
    "#{username}"
  end
  
  def full_list_url
    if RAILS_ENV == 'production'
      return "http://twitdo.com/#{username}"
    else
      return "http://localhost:3000/#{username}"
    end
  end
  
  def twitter_profile_url
    "http://twitter.com/#{username}"
  end
end
