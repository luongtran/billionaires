class Api::V1::ProfilesController < Api::BaseController
  before_action :authenticate_user!, only: [:show, :update]

  def show
  end

  def update
    if current_user.update_attributes(user_params)
      render_success 'Profile updated'
    else
      render_bad_params 'Failed to update profile', current_user.errors.full_messages
    end
  end

  def invitation
    user = User.invite!(invitation_params, current_user)
    if user.new_record?
      render_bad_params 'Failed to sent invite', user.errors.full_messages
    else
      render_success "Invite email sent"
    end
  end

  private

  def invitation_params
    params.permit(:email, :name)
  end

  def user_params
    params.require(:user).permit(:name, :surname, :phone, :gender, :company_name, :organisation, :website)
  end

end
