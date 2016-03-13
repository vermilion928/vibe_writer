Rails.application.routes.draw do
  resources :client_screens, only: [:index]
  root 'standby_screens#index'
end
