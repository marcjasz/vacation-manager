class Vacation < ApplicationRecord
    has_many :groups, dependent: :destroy
    belongs_to :organizer
end
