class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.date :date
      t.decimal :amount
      t.string :service

      t.timestamps
    end
  end
end
