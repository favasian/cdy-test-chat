class Provider::BaseController < ApplicationController

  layout 'provider'

  before_action :load_provider

  private

  def load_provider
    @current_provider = Provider.find(params[:provider_id])
  end

end