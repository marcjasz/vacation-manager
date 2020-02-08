class Participant < ApplicationRecord
    has_many :participations
    has_many :groups, through: :participations
    has_many :payments, through: :participations

    def full_name
        name + " " + surname
    end

    def payments_sum
        ActiveRecord::Base.connection.execute("SELECT payments_sum(#{id})").values.flatten.first.to_d
    end
end
