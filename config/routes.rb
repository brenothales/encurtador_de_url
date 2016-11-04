Rails.application.routes.draw do

  root to: 'stats#index'
  get 'api' => 'statsapi#index'
  get "/:shorturl", to: "stats#show"
  get "shortened/:shorturl", to: "stats#shortened", as: :shortened
  # resources :stats, only: :create

  resources :statsapi, only: :index
  resources :stats

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
