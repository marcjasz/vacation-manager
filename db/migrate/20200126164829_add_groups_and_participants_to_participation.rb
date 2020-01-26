class AddGroupsAndParticipantsToParticipation < ActiveRecord::Migration[6.0]
  def change
    add_reference :participations, :group, foreign_key: true
    add_reference :participations, :participant, foreign_key: true
  end
end
