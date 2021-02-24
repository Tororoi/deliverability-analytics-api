class Device < ApplicationRecord
    validates :phone_number, presence: true
    validates :phone_number, phone: true
    validates :carrier, presence: true

    has_many :heartbeats
    has_many :reports

    def phone_number=(val)
        write_attribute(:phone_number, Phonelib.parse(val).e164)
    end
end
