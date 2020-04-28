Rails.application.routes.draw do
  resources :bands, only: [:index, :show]
  resources :musicians, only: [:index, :show]
end
