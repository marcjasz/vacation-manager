Rails.application.routes.draw do
  root 'vacations#index'
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
  post '/participants/:id/assign_group', to: 'participants#assign_group', as: 'add_participant_to_group'
  post '/participants/:id/remove_group/:group_id', to: 'participants#remove_group', as: 'remove_participant_from_group'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
