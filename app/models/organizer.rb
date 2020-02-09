class Organizer < ApplicationRecord
    has_many :vacations
    validates :nip, length: { is: 10 }, numericality: { only_integer: true }
end
