class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  protected

  def after_sign_in_path_for(resource)
    '/backend'
  end

  def set_layout
    devise_controller? ? 'devise' : 'application'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:email, :password, :password_confirmation, :first_name, :last_name,
        devices_attributes: [:os, :device_token],
        profile_attributes: [:photo, :city],
        location_attributes: [:lat, :lng]])
    devise_parameter_sanitizer.permit(:sign_in,
      keys: [:email, :username, :login, :password, :os, :device_token])
  end
end
