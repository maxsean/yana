Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # user sign in and sign out
  post '/', to: 'sessions#create'
  delete '/', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :illnesses, only: [:index, :show]
      resources :forums, only: [:show]
      resources :posts, only: [:show, :create, :update, :destroy]
      resources :comments, only: [:create, :update, :destroy]
      resources :post_votes, only: [:create, :update]
      resources :surveys, only: [:index, :show]
      resources :submissions, only: [:create]
      resources :charts, only: [:index]
    end
  end

  resources :charts, only: [:index]

  root 'static_pages#index'

  get '*path', to: 'static_pages#index'
end
