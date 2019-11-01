Rails.application.routes.draw do
  get 'uploader/proUpload'
  post 'uploader/proUpload', to: 'uploader#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
