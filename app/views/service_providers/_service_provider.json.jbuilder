json.extract! service_provider, :id, :nip, :address, :name, :phone_number, :email, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
