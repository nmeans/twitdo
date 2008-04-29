class Status < ActiveResource::Base
  self.site = "http://need2:etacidnys@twitter.com"
  
  def self.replies(page = 1)
    find(:all, :from => '/replies.xml', :params => { :page => page })
  end
end