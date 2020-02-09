class Group < ApplicationRecord
    belongs_to :vacation
    has_and_belongs_to_many :counselors 
    has_and_belongs_to_many :lodgings 
    has_many :participations
    has_many :participants, through: :participations
    has_many :payments, through: :participations
end
