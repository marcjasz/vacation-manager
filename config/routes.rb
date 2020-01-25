Rails.application.routes.draw do
  resources :lodgings
  resources :service_providers
  resources :invoices
  resources :organizers
  resources :vacations
  resources :counselors
  resources :payments
  resources :participations
  resources :groups
  resources :participants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
