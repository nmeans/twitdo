module Parser
  def self.parse_replies 
    page = 1
    last_tweet = ::Todo.find(:first, :order => "tweet_id DESC")
    last_id = last_tweet.nil? ? 1 : last_tweet.tweet_id
    
    while 1
      Status.replies(page).each do |st|
        return if st.id.to_i >= last_id
        add_todo(st)
      end
      page = page + 1
    end
  end
  
  private
  
  def add_todo(st)
    account = Account.find_or_create_by_username(st.user.screen_name)
    if account.new_record?
      # Handle new accounts here
    end
    todo = Todo.new({ :tweet_id => st.id})
    todo.description = st.text.gsub("@need2","").strip
    account.todos << todo
  end
end