class RecruiterUser::BaseController < ApplicationController

  layout 'recruiter'

  before_action :load_user

  private

  def load_user
    @current_user = User.where(id: params[:user_id]).first
    @current_account = @current_user.account
  end

end