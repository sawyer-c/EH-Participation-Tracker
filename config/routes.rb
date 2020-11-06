# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout' => 'sessions#destroy'
  resources :students do
    collection { post :import }
    collection { post :export }
  end
  resources :events do
    collection { post :import }
    collection { post :export }
  end
  root 'sessions#welcome'

  post "events/attach_to_student" => "events#attach_to_student"
  post "events/detach_from_student" => "events#detach_from_student"

  resources :students
  resources :events

  namespace :api do
    namespace :v1 do
      resources :students, param: :uin
      resources :events, param: :name
    end
  end
end