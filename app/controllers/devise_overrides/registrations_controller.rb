class DeviseOverrides::RegistrationsController < DeviseTokenAuth::RegistrationsController

  def create
    super do |resource|
      if params[:device]
        device = Device.find_or_create_by(token: params[:device][:token])
        device.update_attributes(os: params[:device][:os], user_id: resource.id)
      end
    end
  end

  protected

  # def render_create_error_missing_confirm_success_url
  #   render_success
  # end
  # def render_create_error_redirect_url_not_allowed
  #   render_success
  # end
  # def render_create_success
  #   render_success
  # end
  # def render_create_error
  #   render_success
  # end
  # def render_create_error_email_already_exists
  #   render_success
  # end
  # def render_update_success
  #   render_success
  # end
  # def render_update_error
  #   render_success
  # end
  # def render_update_error_user_not_found
  #   render_success
  # end


end
