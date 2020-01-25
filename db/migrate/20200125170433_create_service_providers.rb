class CreateServiceProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :service_providers do |t|
      t.string :nip
      t.string :address
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
