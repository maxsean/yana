Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/', to: 'sessions#create'
  delete '/', to: 'sessions#destroy'
  #
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :illnesses, only: [:index, :show]
      resources :forums, only: [:show]
      resources :posts, only: [:show, :create, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :post_votes, only: [:create, :update]
    end
  end

  resources :charts
  # resources :users
  root 'static_pages#index'
  get '*path', to: 'static_pages#index'
end
