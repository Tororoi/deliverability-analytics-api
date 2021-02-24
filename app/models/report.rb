class Report < ApplicationRecord
  validates :message, presence: true
  validates :sender, presence: true
  validates :device_id, presence: true

  belongs_to :device
end
