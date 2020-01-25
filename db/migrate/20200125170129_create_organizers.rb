class CreateOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers do |t|
      t.string :email
      t.string :nip
      t.string :name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
