Rails.application.routes.draw do
  #setting app root dir
  root to: 'professor#sections'
  
  #user login resources
  devise_for :users
  
  #resourceful routes for models

  resources :uploader
  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
