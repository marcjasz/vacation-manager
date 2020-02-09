class AddInvoiceToVacation < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :vacation, foreign_key: true
  end
end
