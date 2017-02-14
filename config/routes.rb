Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  namespace :backend, defaults: {format: 'html'} do
    root to: 'dashboard#index'
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',  controllers: {
        registrations:      'devise_overrides/registrations',
        sessions:           'devise_overrides/sessions'
      }
    end
  end
end
