class CreateCounselors < ActiveRecord::Migration[6.0]
  def change
    create_table :counselors do |t|
      t.string :pesel
      t.string :name
      t.string :surname
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
