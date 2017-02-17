class Api::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  respond_to :json

  if Rails.env.production?
    rescue_from StandardError do |_e|
      log_server_error(_e, {
        current_user: current_user.try(:id)
      })
      render_server_errror
    end

    rescue_from Api::UnexpectedError do |e|
      log_server_error(_e, {
        current_user: current_user.try(:id)
      })
      render_error(
        Api::Status::SERVER_ERROR,
        "An server error is occurred while processing your request. Sorry for inconvenience."
      )
    end

    # All the requests should be validate and catching error properly
    # Otherwise this is technical problem
    rescue_from ActiveRecord::RecordInvalid do |_e|
      render_server_errror
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render_error Api::Status::RESOURCE_NOT_FOUND
  end

  rescue_from CanCan::AccessDenied do |exception|
    render_error Api::Status::ACCESS_DENINED
  end

  rescue_from ActionController::ParameterMissing do |e|
    render_error(
      Api::Status::BAD_REQUEST,
      "Parameter '#{e.param}' is missing or empty")
  end
end