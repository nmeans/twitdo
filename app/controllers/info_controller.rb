class InfoController < ApplicationController
  def index
    
  end
  
  def about
    
  end
  
  def get_started
    if request.xhr?
      render :layout => false
    else
      render
    end
  end
end
