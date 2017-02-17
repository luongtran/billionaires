class DeviseOverrides::RegistrationsController < DeviseTokenAuth::RegistrationsController

  def create
    super do |resource|
      if params[:device]
        device = Device.find_or_create_by(token: params[:device][:token])
        device.update_attributes(os: params[:device][:os], user_id: resource.id)
      end
    end
  end

  def facebook

  end

  def twitter

  end

  protected

  def render_create_success
    render_success I18n.t('devise.registrations.signed_up_but_unconfirmed') do |json|
      json[:data] = resource_data(resource_json: @resource.token_validation_response)
    end
  end
  def render_create_error
    render_error(
      Api::Status::BAD_PARAMETERS,
      I18n.t("errors.messages.not_saved", count: @resource.errors.size, resource: @resource.class_name)
      )
  end

  def render_create_error_email_already_exists
    render_success
  end
  def render_update_success
    render_success
  end
  def render_update_error
    render_success
  end
  def render_update_error_user_not_found
    render_success
  end


end
