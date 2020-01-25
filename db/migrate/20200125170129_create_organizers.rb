class CreateOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers do |t|
      t.string :nip, null: false
      t.string :email
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
