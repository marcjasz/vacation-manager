json.extract! counselor, :id, :pesel, :name, :surname, :address, :phone_number, :created_at, :updated_at
json.url counselor_url(counselor, format: :json)
