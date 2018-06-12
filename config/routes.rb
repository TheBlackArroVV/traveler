Rails.application.routes.draw do
  namespace :v1, defaults: {format: 'json'} do
    resources :posts
    post '/users', to: 'users/registrations#create'
    post 'user_token' => 'users/user_token#create'
  end
end
