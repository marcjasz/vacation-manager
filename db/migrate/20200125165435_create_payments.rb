class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.decimal :amount, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
