class Api::V1::StatesController < Api::BaseController
  before_action :authenticate_user!

  def index
    @states = State.includes(:cities).all
  end
end
