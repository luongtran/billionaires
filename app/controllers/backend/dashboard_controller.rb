class Backend::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'

  def index
  end
end
