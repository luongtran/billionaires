class DeviseOverrides::SessionsController < DeviseTokenAuth::SessionsController

  def destroy
    super do |resource|
      if params[:os] && params[:device_token]
        resource.devices.where(os: params[:os], device_token: params[:device_token]).delete_all
      end
    end
  end
end
