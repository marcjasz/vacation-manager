class Vacation < ApplicationRecord
    has_many :groups, dependent: :destroy
    has_many :invoices, dependent: :destroy
    belongs_to :organizer
    validates :name, presence: true, uniqueness: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :start_must_be_before_end_date

    private

    def start_must_be_before_end_date
        errors.add(:start_date, "must be before end date") unless
            start_date <= end_date
    end 
end
