Rails.application.routes.draw do

  get 'book/list'
  get 'book/show'
  get 'book/new'
  post 'book/create'
  get 'book/delete'
  get 'book/edit'
  patch 'book/update'

  get 'subjects/list'
  get 'subjects/show_subjects'

  root 'book#list'
end
