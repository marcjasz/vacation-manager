class Participant < ApplicationRecord
    has_many :participations, foreign_key: 'participant_pesel'
    has_many :groups, through: :participations
    has_many :payments, through: :participations
    validates :pesel, length: { is: 11 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :surname, presence: true
    validates :phone_number, presence: true, numericality: true, length: { maximum: 12 }

    self.primary_key = 'pesel'

    def full_name
        name + " " + surname
    end

    def payments_sum
        ActiveRecord::Base.connection.execute("SELECT payments_sum('#{pesel}')").values.flatten.first.to_d
    end
end
