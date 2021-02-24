class Device < ApplicationRecord
    # validates :phone_number, format: {}
    validates :carrier, presence: true

    has_many :heartbeats
    has_many :reports
end
