class Participant < ApplicationRecord
    has_many :participations
    has_many :groups, through: :participations

    def full_name
        name + " " + surname
    end
end
