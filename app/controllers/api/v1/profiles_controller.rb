class Api::V1::ProfilesController < Api::BaseController
  before_action :authenticate_user!, only: [:show]

  def show
  end

  def update
    if current_user.update_attributes(user_params)
      render_success 'Profile updated'
    else
      render_bad_parameters 'Failed to update profile', current_user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :phone, :gender, :company_name, :organisation, :website)
  end

end
