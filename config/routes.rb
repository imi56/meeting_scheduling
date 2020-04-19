Rails.application.routes.draw do
  root :to => 'application#api'
  namespace :api do
    namespace :v1 do
      #region Authentication routes
        post 'login' => 'authentication#login'
        post 'sign_up' => 'authentication#sign_up'
        post 'otp/create' => 'otps#create'
    end
  end
end
