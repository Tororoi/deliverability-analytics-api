require 'rails_helper'

RSpec.describe Report, type: :model do
  device = Device.create(phone_number: '4015746041', carrier: 'Verizon') 
  report = device.reports.new(device_id: device.id, message: 'Hi from testing 😁', sender: 'Tester')
  before { report.save }

  it 'device should be present' do
    report.device_id = nil
    expect(report).to_not be_valid
  end

  it 'message should be present' do
    report.device_id = device.id
    report.message = nil
    expect(report).to_not be_valid
  end

  it 'sender should be present' do
    report.message = 'Hi from testing 😁'
    report.sender = nil
    expect(report).to_not be_valid
  end
end
