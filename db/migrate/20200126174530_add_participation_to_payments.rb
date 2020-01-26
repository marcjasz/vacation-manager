class AddParticipationToPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :participation, foreign_key: true
  end
end
