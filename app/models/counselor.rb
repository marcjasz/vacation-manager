class Counselor < ApplicationRecord
    has_and_belongs_to_many :groups
    validates :pesel, length: { is: 11 }, numericality: { only_integer: true }
    validates :name, presence: true
    validates :surname, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true

    def full_name
        name + " " + surname
    end
end
