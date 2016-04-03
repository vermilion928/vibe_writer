Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resource :client_screen, only: [:show]
  resource :standby_screen, only: [:show]

  root 'standby_screens#show'
end
