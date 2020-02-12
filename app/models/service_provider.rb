class ServiceProvider < ApplicationRecord
    has_many :invoices, foreign_key: 'service_provider_nip'
    validates :nip, length: { is: 10 }, numericality: { only_integer: true }, uniqueness: true
    validates :name, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
    validates :email, presence: true

    self.primary_key = 'nip'
end
