json.extract! lodging, :id, :owner, :company, :capacity, :address, :name, :phone_number, :email, :created_at, :updated_at, :group_ids
json.url lodging_url(lodging, format: :json)
