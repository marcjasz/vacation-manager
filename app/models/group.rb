class Group < ApplicationRecord
    belongs_to :vacation, foreign_key: 'vacation_name'
    has_and_belongs_to_many :counselors, join_table: 'group_supervision', association_foreign_key: 'counselor_pesel' 
    has_and_belongs_to_many :lodgings, join_table: 'hostings', association_foreign_key: 'lodging_name'
    has_many :participations, foreign_key: ['participant_pesel', 'group_id']
    has_many :participants, through: :participations, foreign_key: 'participant_pesel'
    has_many :payments, through: :participations

end
