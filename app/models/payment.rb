class Payment < ApplicationRecord
    belongs_to :participation, inverse_of: :payments, foreign_key: [:participant_pesel, :group_id]
    delegate :group, to: :participation
    delegate :participant, to: :participation
    validates :amount, numericality: true
    validates :date, presence: true
end
