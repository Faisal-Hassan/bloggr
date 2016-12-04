Rails.application.routes.draw do

  resources :users, except: [:new]
  
  get 'signup', to: 'users#new' 
  
  resources :articles
  
  get 'about', to: 'pages#about'
  
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
