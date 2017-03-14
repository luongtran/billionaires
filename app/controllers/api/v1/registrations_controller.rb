class Api::V1::RegistrationsController < Api::BaseController

  def facebook
    fb_token = params[:fb_token]
    fb_user_id = params[:fb_user_id]

    begin
      auth = FbGraph2::Auth.new(ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'])
      tok = auth.debug_token! fb_token
      fb_user = FbGraph2::User.new(fb_user_id).authenticate(tok.access_token)
      @fb_user = fb_user.fetch(fields: ['email','picture'])
    rescue Exception => e
      render_bad_params "Error", e.message
      return
    end

    find_or_init_user_from_facebook_data

    if @user.new_record?
      set_random_password
      update_user_information
      @user.skip_confirmation!
    end


    if @user.save
      if params[:device] && params[:device][:os] && params[:device][:token]
        device = Device.find_or_create_by(token: params[:device][:token])
        device.update_attributes(os: params[:device][:os], user_id: @user.id)
      end
      sign_in(:user, @user, store: false, bypass: false)
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      auth_header = @user.create_new_auth_token(@client_id)
      response.headers.merge!(auth_header)
      render_success do |json|
        json[:data] = @user.token_validation_response
      end
    else
      render_bad_params "Failed to create user", @user.errors.full_messages
    end
  end

  def twitter
    log = Logger.new('log/twitter_login.log')
    log.info(params)
    render_success do |json|
      json[:data] = 'Not implement yet'
    end
  end

  protected

  def find_or_init_user_from_facebook_data
    if User.exists?(email: @fb_user.email)
      @user = User.find_by_email(@fb_user.email)
    else
      # find or create user by provider and provider uid
      @user = User.where({
        uid:      @fb_user.id,
        provider: 'facebook'
      }).first_or_initialize
    end
  end

  def set_random_password
    # set crazy password for new oauth users. this is only used to prevent
      # access via email sign-in.
      p = SecureRandom.urlsafe_base64(nil, false)
      @user.password = p
      @user.password_confirmation = p
  end

  def update_user_information
    @user.assign_attributes({
      uid:      @fb_user.id,
      provider: 'facebook',
      email:    @fb_user.email || "#{@fb_user.id}@facebook.com",
      name: @fb_user.name
    })
  end
end
