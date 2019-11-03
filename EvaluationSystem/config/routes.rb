Rails.application.routes.draw do
<<<<<<< HEAD
  resources :uploader
=======
  get 'uploader/proUpload'
  post 'uploader/proUpload', to: 'uploader#upload'
>>>>>>> parent of a5e1d14... Revert "Prop upload"
  resources :questions
  resources :surveys
  resources :sections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
