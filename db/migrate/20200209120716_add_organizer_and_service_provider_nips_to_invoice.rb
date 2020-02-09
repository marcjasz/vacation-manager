class AddOrganizerAndServiceProviderNipsToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :organizer_nip, :string
    add_column :invoices, :service_provider_nip, :string
  end
end
