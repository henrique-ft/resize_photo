Rails.application.routes.draw do
  get '/resize-photos', to: 'photos#resize_photos'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
