class AddUniqueIndexOnParticipantPesel < ActiveRecord::Migration[6.0]
  def change
    add_index :participants, :pesel, unique: true
  end
end
