Rails.application.routes.draw do

  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout'  => 'sessions#destroy'
  resources :students

  get 'book/list'
  get 'book/show'
  get 'book/new'
  post 'book/create'
  get 'book/delete'
  get 'book/edit'
  patch 'book/update'

  get 'students/list'
  get 'students/show_students'

  root 'book#list'

end
