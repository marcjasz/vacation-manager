Rails.application.routes.draw do
  root 'vacations#index'
  resources :lodgings, param: :name
  post '/lodgings/:name/assign_group', to: 'lodgings#assign_group', as: 'add_lodging_to_group'
  post '/lodgings/:name/remove_group/:group_id', to: 'lodgings#remove_group', as: 'remove_lodging_from_group'
  resources :service_providers, param: :nip
  resources :invoices, param: :invoice_number
  resources :organizers, param: :nip
  resources :vacations, param: :name
  resources :counselors, param: :pesel
  post '/counselors/:pesel/assign_group', to: 'counselors#assign_group', as: 'add_counselor_to_group'
  post '/counselors/:pesel/remove_group/:group_id', to: 'counselors#remove_group', as: 'remove_counselor_from_group'
  resources :payments
  resources :groups
  resources :participants, param: :pesel
  post '/participants/:pesel/assign_group', to: 'participants#assign_group', as: 'add_participant_to_group'
  post '/participants/:pesel/remove_group/:group_id', to: 'participants#remove_group', as: 'remove_participant_from_group'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
