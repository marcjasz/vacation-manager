class Organizer < ApplicationRecord
    has_many :vacations, foreign_key: 'organizer_nip'
    validates :nip, length: { is: 10 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :phone_number, presence: true, numericality: true, length: { maximum: 12 }
    validates :address, presence: true

    self.primary_key = 'nip'
end
