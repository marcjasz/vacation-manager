class AddUniqueIndexOnVacationName < ActiveRecord::Migration[6.0]
  def change
    add_index :vacations, :name, unique: true
  end
end
