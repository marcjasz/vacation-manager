class Invoice < ApplicationRecord
    belongs_to :vacation
    belongs_to :service_provider
    after_create :update_nips
    validates :amount, numericality: { greater_than: 0 }
    validates :service, presence: true

    def update_nips
        ActiveRecord::Base.connection.execute("CALL update_nips(#{id})")
    end
end
