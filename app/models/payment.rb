class Payment < ApplicationRecord
    belongs_to :participation, inverse_of: :payments
    delegate :group, to: :participation
    delegate :participant, to: :participation
end
