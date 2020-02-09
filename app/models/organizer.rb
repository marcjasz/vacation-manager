class Organizer < ApplicationRecord
    has_many :vacations
    validates :nip, length: { is: 10 }, numericality: { only_integer: true }
    validates :name, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
end
