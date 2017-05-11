Rails.application.routes.draw do

  resources :hearts
  match 'heart', to: 'hearts#heart', via: :post
  
  match 'unheart', to: 'hearts#unheart', via: :delete
  
  resources :categories, :path => 'genres', except: [:destroy]
  
  delete 'logout',	to: 'sessions#destroy'
	post 'login',     to: 'sessions#create'
  get 'login',			to: 'sessions#new'
  
  resources :users, except: [:new]
  
  get 'signup', 		to: 'users#new' 
  
  resources :articles, :path => 'stories'
  
  get 'about',			to: 'pages#about'
  
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
