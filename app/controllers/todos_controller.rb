class TodosController < ApplicationController
  def index
    @todos = Todo.find(:all, :limit => 10, :order => 'tweet_time DESC')
  end
end
