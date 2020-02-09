class AddUniqueIndexOnLodgingName < ActiveRecord::Migration[6.0]
  def change
    add_index :lodgings, :name, unique: true
  end
end
