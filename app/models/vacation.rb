class Vacation < ApplicationRecord
    has_many :groups, foreign_key: 'vacation_name'
    has_many :invoices, foreign_key: 'vacation_name'
    belongs_to :organizer, foreign_key: 'organizer_nip'
    validates :name, presence: true, uniqueness: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :start_must_be_before_end_date

    self.primary_key = 'name'

    private

    def start_must_be_before_end_date
        errors.add(:start_date, "must be before end date") unless
            start_date <= end_date
    end 
end
