class AddVacationToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :vacation, foreign_key: true
  end
end
