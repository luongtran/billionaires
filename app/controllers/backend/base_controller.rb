class Backend::BaseController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
end
