class Group < ApplicationRecord
    belongs_to :vacation
    has_and_belongs_to_many :counselors 
end
