class Api::V1::ProfilesController < Api::BaseController
  before_action :authenticate_user!
  def show
    render_success do |json|
      json[:data] = current_user.to_json
    end
  end
end
