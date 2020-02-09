class Invoice < ApplicationRecord
    belongs_to :vacation
    belongs_to :service_provider
end
