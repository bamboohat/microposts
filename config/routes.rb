Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  resource :users do
    member do
      #get :followings, :followers
      get '/:id/followings', to: 'users#followings', as: 'followings'
      get '/:id/followers', to: 'users#followers', as: 'followers'
    end  end
    
end
