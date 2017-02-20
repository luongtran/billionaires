Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  namespace :backend, defaults: {format: 'html'} do
    root to: 'dashboard#index'
    resource :profile, only: [:show, :update, :destroy] do
      get :account_setting
    end
    resources :users do
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',  controllers: {
        registrations:      'devise_overrides/registrations',
        sessions:           'devise_overrides/sessions'
      }

      controller :registrations do
        post :facebook, path: 'auth/facebook'
      end

      resource :profile, only: [:show, :update, :destroy]
    end
    match "*path", to: "base#render_endpoint_not_exists", via: :all
  end


  controller :home do
    get :welcome, path: 'pages/welcome'
  end
end
