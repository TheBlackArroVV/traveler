Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users
      resources :posts

      namespace :users do
        resources :profiles, only: :index do
          patch :update, on: :collection
        end
      end
      resources :countries, only: :index

      resources :cities, only: :index

      resources :sights do
        member do
          patch :like, :dislike
        end

        collection do
          get :liked, :recommended
        end
      end

      resources :topics, except: :update do
        resources :messages
      end

      resources :trips do
        patch :join, on: :member
      end

      post :user_token, to: 'users/user_token#create'
    end
  end
end
