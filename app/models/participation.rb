class Participation < ApplicationRecord
    belongs_to :participant
    belongs_to :group
    has_many :payments, inverse_of: :participation, dependent: :destroy
    delegate :vacation_id, to: :group

    validate :participant_unique_per_vacation

    private

    def participant_unique_per_vacation
        if participant.groups.map { |group| group.vacation_id }.uniq.include?(group.vacation.id)
            errors.add :participation, 'in this vacation already exists'
        end
    end
end
