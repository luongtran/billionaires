class Api::V1::ProfilesController < Api::BaseController
  before_action :authenticate_user!, only: [:show]

  def show
  end

end
