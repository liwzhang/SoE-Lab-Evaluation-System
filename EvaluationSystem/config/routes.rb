Rails.application.routes.draw do
  get 'question/index'
  get 'question/new'
  post 'question/create'
  patch 'question/update'
  get 'question/show'
  get 'question/edit'
  get 'question/delete'
  get 'question/update'
  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
