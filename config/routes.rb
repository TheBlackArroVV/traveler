Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users
      post 'user_token' => 'users/user_token#create'

      resources :posts
    end
  end
end
