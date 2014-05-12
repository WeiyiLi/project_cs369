ProjectCs369::Application.routes.draw do

  resources :users do
    member do
      get :watchlist
    end
  end
  resources :watchlists, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :series, only: [:show] do
    member do
      get :followers
    end
  end

  root  'static_pages#home'
  match '/signup', to: 'users#new',            via: 'get'
  match '/login',  to: 'sessions#new',         via: 'get'
  match '/logout', to: 'sessions#destroy',     via: 'delete'

end
