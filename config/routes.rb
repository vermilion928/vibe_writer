Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :client_screens, only: [:index]

  root 'standby_screens#index'
end
