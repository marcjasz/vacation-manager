class AddUniqueIndexOnOrganizerNip < ActiveRecord::Migration[6.0]
  def change
    add_index :organizers, :nip, unique: true
  end
end
