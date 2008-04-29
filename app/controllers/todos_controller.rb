class TodosController < ApplicationController
  def index
    @todos = Todo.find(:all, :limit => 10, :order => 'id DESC', :include => "account")
  end
end
