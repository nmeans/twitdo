module Parser
  def self.parse_replies 
    page = 1
    last_tweet = ::Todo.find(:first, :order => "tweet_id DESC")
    last_id = last_tweet.nil? ? 1 : last_tweet.tweet_id
    
    catch :keep_going do
      replies = Status.replies(page)
      processed = replies.size
      replies.each do |st|
        break if st.id.to_i <= last_id
        add_todo(st)
        processed = processed - 1
        puts processed
      end
      page = page + 1
      throw :keep_going unless processed != 0 || replies.empty?
    end
  end
  
  private
  
  def self.add_todo(st)
    account = Account.find_or_create_by_username(st.user.screen_name)
    if account.new_record?
      # Handle new accounts here
    end
    todo = Todo.new({ :tweet_id => st.id})
    todo.description = st.text.gsub("@need2","").strip
    account.todos << todo
  end
end