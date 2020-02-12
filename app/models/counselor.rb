class Counselor < ApplicationRecord
    has_and_belongs_to_many :groups, join_table: 'group_supervision', foreign_key: 'counselor_pesel'
    validates :pesel, length: { is: 11 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :surname, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true

    self.primary_key = 'pesel'

    def full_name
        name + " " + surname
    end
end
