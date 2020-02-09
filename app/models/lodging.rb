class Lodging < ApplicationRecord
    has_and_belongs_to_many :groups
    validates :owner, presence: true
    validates :company, presence: true
    validates :capacity, presence: true
    validates :address, presence: true
    validates :name, presence: true
    validates :phone_number, presence: true
end
