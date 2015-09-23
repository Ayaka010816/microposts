Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get     'users'  => 'users#edit' 
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts #２で追加
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following
      get :followers
    end
  end
end