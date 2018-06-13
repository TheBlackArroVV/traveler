Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    devise_for :users, contollers: { registrations: 'registrations' }
    resources :posts
    post 'user_token' => 'users/user_token#create'
  end
end
