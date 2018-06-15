Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users
      resources :posts
      post 'user_token' => 'users/user_token#create'
    end
  end
end
