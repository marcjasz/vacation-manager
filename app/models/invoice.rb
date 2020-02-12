class Invoice < ApplicationRecord
    belongs_to :vacation, foreign_key: 'vacation_name'
    belongs_to :service_provider, foreign_key: 'service_provider_nip'
    validates :amount, numericality: { greater_than: 0 }
    validates :service, presence: true

    self.primary_key = 'invoice_number'
end
