class AddUniqueIndexOnServiceProviderNip < ActiveRecord::Migration[6.0]
  def change
    add_index :service_providers, :nip, unique: true
  end
end
