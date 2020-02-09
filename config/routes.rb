Rails.application.routes.draw do
  root 'vacations#index'
  resources :lodgings
  post '/lodgings/:id/assign_group', to: 'lodgings#assign_group', as: 'add_lodging_to_group'
  post '/lodgings/:id/remove_group/:group_id', to: 'lodgings#remove_group', as: 'remove_lodging_from_group'
  resources :service_providers
  resources :invoices
  resources :organizers
  resources :vacations
  resources :counselors
  post '/counselors/:id/assign_group', to: 'counselors#assign_group', as: 'add_counselor_to_group'
  post '/counselors/:id/remove_group/:group_id', to: 'counselors#remove_group', as: 'remove_counselor_from_group'
  resources :payments
  resources :participations
  resources :groups
  resources :participants
  post '/participants/:id/assign_group', to: 'participants#assign_group', as: 'add_participant_to_group'
  post '/participants/:id/remove_group/:group_id', to: 'participants#remove_group', as: 'remove_participant_from_group'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
