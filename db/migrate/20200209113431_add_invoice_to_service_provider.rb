class AddInvoiceToServiceProvider < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :service_provider, foreign_key: true
  end
end
