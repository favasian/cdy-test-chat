class OwnerUser::BaseController < ApplicationController

  layout 'owner'

  before_action :load_owner

  private

  def load_owner
    @current_owner = Owner.find(params[:owner_id])
    @current_user = @current_owner.users.where(id: params[:user_id]).first
  end

end