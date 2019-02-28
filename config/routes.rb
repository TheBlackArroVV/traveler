Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :admin do
      resources :cities
      resources :countries, except: :show
      resources :users, only: %i[index destroy]
      resources :comments, only: %i[index destroy]
      resources :messages, only: %i[index destroy]
      resources :posts, only: %i[index destroy]
      resources :sights, only: %i[index destroy]
      resources :topics, only: %i[index destroy]
      resources :trips, only: %i[index destroy]
    end

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

      resources :comments, except: %i[show update]
    end
  end
end
