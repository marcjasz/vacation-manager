class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.date :date, null: false
      t.decimal :amount, null: false
      t.string :service, null: false

      t.timestamps
    end
  end
end
