class Participant < ApplicationRecord
    has_many :participations
    has_many :groups, through: :participations
    has_many :payments, through: :participations
    validates :pesel, length: { is: 11 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :surname, presence: true
    validates :phone_number, presence: true

    def full_name
        name + " " + surname
    end

    def payments_sum
        ActiveRecord::Base.connection.execute("SELECT payments_sum(#{id})").values.flatten.first.to_d
    end
end
