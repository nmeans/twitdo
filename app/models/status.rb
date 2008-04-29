class Status < ActiveResource::Base
  self.site = "http://need2:etacidnys@twitter.com"
  
  def self.replies
    find(:all, :from => '/replies.xml')
  end
end