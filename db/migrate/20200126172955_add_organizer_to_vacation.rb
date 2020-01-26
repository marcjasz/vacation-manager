class AddOrganizerToVacation < ActiveRecord::Migration[6.0]
  def change
    add_reference :vacations, :organizer, foreign_key: true
  end
end
