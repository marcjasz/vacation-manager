class Participation < ApplicationRecord
    belongs_to :participant
    belongs_to :group
    has_many :payments, inverse_of: :participation
    delegate :vacation_id, to: :group

    validate :participant_unique_per_vacation

    private

    def participant_unique_per_vacation
        if participant.groups.map { |group| group.vacation_id }.uniq.include?(vacation_id: id)
            errors.add :participation, 'participant is already assigned to this vacation'
        end
    end
end
