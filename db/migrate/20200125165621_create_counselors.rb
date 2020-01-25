class CreateCounselors < ActiveRecord::Migration[6.0]
  def change
    create_table :counselors do |t|
      t.string :pesel, limit: 13, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.string :address, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
