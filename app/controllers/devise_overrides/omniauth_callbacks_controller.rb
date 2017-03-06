class DeviseOverrides::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def omniauth_success
    get_resource_from_auth_hash
    create_token_info
    set_token_on_resource
    create_auth_params

    if resource_class.devise_modules.include?(:confirmable)
      @resource.skip_confirmation!
    end

    sign_in(:user, @resource, store: false, bypass: false)

    @resource.save!

    yield @resource if block_given?

    render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)
  end

  protected

  def create_auth_params
    @auth_params = {
     'access-token':     @token,
     client: @client_id,
     uid:       @resource.uid,
     expiry:    @expiry,
     config:    @config
    }
    @auth_params.merge!(oauth_registration: true) if @oauth_registration
    @auth_params
  end


  def assign_provider_attrs(user, auth_hash)
    log = Logger.new('log/omniauth.log')
    log.info auth_hash
    user.assign_attributes({
      nickname: auth_hash['info']['nickname'],
      name:     auth_hash['info']['name'],
      email:    auth_hash['info']['email'] || [auth_hash['uid'], auth_hash['provider']].join("@") << ".com"
    })
  end

  def get_resource_from_auth_hash
    # find or create user by provider and provider uid
    @resource = resource_class.where({
      uid:      auth_hash['uid'],
      provider: auth_hash['provider']
    }).first_or_initialize

    if @resource.new_record?
      @oauth_registration = true
      set_random_password
    end

    # sync user info with provider, update/generate auth token
    assign_provider_attrs(@resource, auth_hash)

    # assign any additional (whitelisted) attributes
    extra_params = whitelisted_params
    @resource.assign_attributes(extra_params) if extra_params

    @resource
  end

end
