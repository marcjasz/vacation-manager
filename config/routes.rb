Rails.application.routes.draw do
  resources :counselors
  resources :payments
  resources :participations
  resources :groups
  resources :participants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
