class CreateJoinTableGroupsCounselors < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :counselors do |t|
      t.index :group_id
      t.index :counselor_id
    end
  end
end
