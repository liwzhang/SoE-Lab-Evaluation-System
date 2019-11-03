Rails.application.routes.draw do
  #root to: 'questions/index'

  get 'surveys/index'
  get 'surveys/new'
  post 'surveys/create'
  patch 'surveys/update'
  get 'surveys/show'
  get 'surveys/edit'
  get 'surveys/delete'
  get 'surveys/update'

  get 'questions/index'
  get 'questions/new'
  post 'questions/create'
  patch 'questions/update'
  get 'questions/show'
  get 'questions/edit'
  get 'questions/delete'
  get 'questions/update'

  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
