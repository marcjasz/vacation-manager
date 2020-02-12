class Lodging < ApplicationRecord
    has_and_belongs_to_many :groups, join_table: 'hostings', foreign_key: 'lodging_name'
    validates :owner, presence: true
    validates :company, presence: true
    validates :capacity, presence: true
    validates :address, presence: true
    validates :name, presence: true, uniqueness: true
    validates :phone_number, presence: true, numericality: true, length: { maximum: 12 }

    self.primary_key = 'name'
end
