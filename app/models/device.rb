class Device < ApplicationRecord
    has_many :heartbeats, :reports
end
