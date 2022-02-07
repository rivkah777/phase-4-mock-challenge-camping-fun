Rails.application.routes.draw do
  resources :camper_activities, only: [:create]
  resources :signups , only: [:post]
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :post ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
