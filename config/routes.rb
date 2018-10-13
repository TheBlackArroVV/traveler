Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users
      resources :posts
      namespace :users do
        resources :profiles, only: :create
      end
      post :user_token, to: 'users/user_token#create'
    end
  end
end
