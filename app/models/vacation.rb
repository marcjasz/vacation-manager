class Vacation < ApplicationRecord
    has_many :groups, dependent: :destroy
end
