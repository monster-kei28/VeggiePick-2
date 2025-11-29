Rails.application.routes.draw do
  root "static_pages#top"
  resources :reservations, only: %i[new create]
end
