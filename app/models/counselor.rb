class Counselor < ApplicationRecord
    has_and_belongs_to_many :groups

    def full_name
        name + " " + surname
    end
end
