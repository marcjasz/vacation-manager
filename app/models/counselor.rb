class Counselor < ApplicationRecord
    def full_name
        name + " " + surname
    end
    
    has_and_belongs_to_many :groups
end
