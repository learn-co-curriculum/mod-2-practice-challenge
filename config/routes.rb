Rails.application.routes.draw do
  resources :bands, only: [:index, :show]
end
