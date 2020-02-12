class Participation < ApplicationRecord
    belongs_to :participant, foreign_key: 'participant_pesel'
    belongs_to :group
    has_many :payments, inverse_of: :participation, foreign_key: [:participant_pesel, :group_id]
    delegate :vacation_id, to: :group

    validate :participant_unique_per_vacation

    self.primary_keys = 'participant_pesel', 'group_id'

    private

    def participant_unique_per_vacation
        if participant.groups.map { |group| group.vacation_id }.uniq.include?(group.vacation.id)
            errors.add :participation, 'in this vacation already exists'
        end
    end
end
