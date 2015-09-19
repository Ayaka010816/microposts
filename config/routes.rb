Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get     'users'  => 'users#edit' 
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts #課題２で追加
end