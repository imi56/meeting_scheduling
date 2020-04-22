Rails.application.routes.draw do
  root :to => 'application#api'
  namespace :api do
    namespace :v1 do
      post 'login' => 'authentication#login'
      post 'sign_up' => 'authentication#sign_up'
      post 'otp/create' => 'otps#create'

      resources :slots, only: [:index]
      resources :user_slots, only: [:create, :index]
      resources :meetings, only: [:create]
    end
  end
end
