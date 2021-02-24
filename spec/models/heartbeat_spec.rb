require 'rails_helper'

RSpec.describe Heartbeat, type: :model do
  device = Device.create(phone_number: '4015746041', carrier: 'Verizon') 
  heartbeat = device.heartbeats.new(device_id: device.id)
  before { heartbeat.save }

  it 'device should be present' do
    heartbeat.device_id = nil
    expect(heartbeat).to_not be_valid
  end
end
