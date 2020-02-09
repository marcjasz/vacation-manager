class AddUniqueIndexOnCounselorPesel < ActiveRecord::Migration[6.0]
  def change
    add_index :counselors, :pesel, unique: true
  end
end
