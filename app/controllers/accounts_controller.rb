class AccountsController < ApplicationController
  def show
    @todos = Account.from_param(params[:id]).todos
  end
end
