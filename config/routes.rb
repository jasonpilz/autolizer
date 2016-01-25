Rails.application.routes.draw do
  root                            to: 'welcome#index'
  get '/auth/automatic',          as: :login
  get '/auth/automatic/callback', to: "sessions#create"
  get '/logout',                  to: "sessions#destroy"
  get '/dashboard',               to: "dashboards#index"
  resources :trips,               only: [:index, :show]
  resources :vehicles,            only: [:index, :show]
  get '/current',                 to: 'users#current'
end
