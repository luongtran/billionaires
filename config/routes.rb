Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  namespace :backend do
    get :dashboard, to: 'dashboard#index'
    resource :profile, only: [:show, :update, :destroy] do
      get :account_setting
    end
    resources :users do
      member do
        post :notification_modal
        post :push_notification
      end
    end
    resources :cars do
      collection do
        post :import
      end
    end
    resources :jets
    resources :yatches
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',  controllers: {
        confirmations:      'devise_overrides/confirmations',
        passwords:          'devise_overrides/passwords',
        omniauth_callbacks: 'devise_overrides/omniauth_callbacks',
        registrations:      'devise_overrides/registrations',
        sessions:           'devise_overrides/sessions',
        token_validations:  'devise_overrides/token_validations'
      }

      controller :registrations do
        post :facebook, path: 'auth/facebook'
      end

      resource :profile, only: [:show, :update, :destroy] do
      end
    end
    match "*path", to: "base#render_endpoint_not_exists", via: :all
  end

  controller :home do
    get :welcome, path: 'pages/welcome'
  end

  match "*path", to: "home#render_404", via: :get
end
