class Vacation < ApplicationRecord
    has_many :groups, dependent: :destroy
    has_many :invoices, dependent: :destroy
    belongs_to :organizer
end
