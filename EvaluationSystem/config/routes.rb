Rails.application.routes.draw do

  #admin area of site
  get 'admin/home'
  get 'admin/sections'
  get 'admin/email'
  get 'admin/professors'
  get 'admin/questions'

  #setting app root dir
  root to: 'professor#sections'

  #email submit button action
  post 'email_students' => 'admin#email_students', as: :email_students
  post 'email_reminder' => 'admin#email_reminder', as: :email_reminder

  #user login resources
  devise_for :users

  #resourceful routes for models
  resources :admin
  resources :evaluation
  resources :uploader
  resources :questions
  resources :surveys
  resources :sections do
    collection do
      delete :destroy_all
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
