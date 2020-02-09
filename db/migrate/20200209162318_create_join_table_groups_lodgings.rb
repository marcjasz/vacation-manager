class CreateJoinTableGroupsLodgings < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :lodgings do |t|
      t.index :group_id
      t.index :lodging_id
    end
  end
end
