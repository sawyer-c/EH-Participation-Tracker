Rails.application.routes.draw do

  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout'  => 'sessions#destroy'
  resources :students do
    collection {post :import}
    collection {post :export}
  end
  resources :events
  root "sessions#welcome"

end
