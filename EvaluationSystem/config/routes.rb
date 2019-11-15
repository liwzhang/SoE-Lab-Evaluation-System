Rails.application.routes.draw do
  get 'admin/home'
  get 'admin/sections'
  get 'admin/email'
  get 'admin/professors'
  get 'admin/questions'

  #setting app root dir
  root to: 'professor#sections'

  #email submit button action
  post 'email_students' => 'admin#email_students', as: :email_students

  #user login resources
  devise_for :users

  #resourceful routes for models
  resources :evaluation
  resources :uploader
  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
