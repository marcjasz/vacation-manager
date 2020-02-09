class ServiceProvider < ApplicationRecord
    has_many :invoices
    validates :nip, length: { is: 10 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
    validates :email, presence: true
end
