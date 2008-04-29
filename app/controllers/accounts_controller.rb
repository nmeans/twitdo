class AccountsController < ApplicationController
  def show
    @account = Account.from_param(params[:id])
  end
end
