class AccountsController < ApplicationController
  def show
    unless @account = Account.from_param(params[:id])
      @id = params[:id]
      render :action => 'not_found', :status => 404
    end
  end
  
  def my_list
    if request.post? && params[:id]
      if @account = Account.from_param(params[:id])
        redirect_to @account.full_list_url
      else
        @id = params[:id]
        render :action => 'not_found', :status => 404
      end
    end
  end
end
