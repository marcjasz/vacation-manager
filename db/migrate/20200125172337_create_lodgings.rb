class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string :owner
      t.string :company
      t.integer :capacity
      t.string :address
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
