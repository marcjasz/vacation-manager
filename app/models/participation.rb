class Participation < ApplicationRecord
    belongs_to :participant
    belongs_to :group
    has_many :payments, inverse_of: :participation
end
