class AccountsController < ApplicationController

  def index
    @accounts = Account.order(name: :asc)
  end

  def show
    @account = Account.find(params[:id])
  end

end