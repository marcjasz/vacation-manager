json.extract! participant, :id, :pesel, :name, :surname, :school, :phone_number, :created_at, :updated_at
json.url participant_url(participant, format: :json)
