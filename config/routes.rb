Rails.application.routes.draw do
  namespace :v1, defaults: {format: 'json'} do
    resources :posts
    post '/users', to: 'users/registrations#create'
  end
end
