class Heartbeat < ApplicationRecord
  validates :device_id, presence: true

  belongs_to :device
end
