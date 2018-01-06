Rails.application.routes.draw do
  root 'photos#index'
  get '/resize-photos', to: 'photos#resize_photos'
end
