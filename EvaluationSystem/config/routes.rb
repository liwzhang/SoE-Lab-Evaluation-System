Rails.application.routes.draw do
  root to: 'professor#sections'
  devise_for :users
  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
