class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :pesel, limit: 13, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.string :school
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
