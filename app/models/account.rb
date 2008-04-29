class Account < ActiveRecord::Base
  has_many :todos, :order => "id DESC"
  
  def to_param
    "#{username}"
  end
  
  def twitter_profile_url
    "http://twitter.com/#{username}"
  end
end
