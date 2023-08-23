class VendorUser::BaseController < ApplicationController

  layout 'vendor'

  before_action :load_vendor

  private

  def load_vendor
    @current_vendor = Vendor.find(params[:vendor_id])
    @current_user = @current_vendor.account.users.where(id: params[:user_id]).first
  end

end