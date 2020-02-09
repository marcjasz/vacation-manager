class Vacation < ApplicationRecord
    has_many :groups, dependent: :destroy
    has_many :invoices, dependent: :destroy
    belongs_to :organizer
    validates :name, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

end
