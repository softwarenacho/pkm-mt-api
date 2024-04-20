Rails.application.routes.draw do
  resources :boards
  get '/players/avatar', to: "players#avatar"
  resources :players
  get "up" => "rails/health#show", as: :rails_health_check
end
