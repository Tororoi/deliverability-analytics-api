# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Device, type: :model do
  device = Device.new(phone_number: '4015746041', carrier: 'Verizon') 

  before { device.save }

  it 'phone_number should be present' do
    device.phone_number = nil
    expect(device).to_not be_valid
  end

  it 'phone_number should be valid' do
    device.phone_number = '1234'
    expect(device).to_not be_valid
  end

  it 'phone_number should be e164 format' do
    device.phone_number = '4015746041'
    expect(device.phone_number).to eq(Phonelib.parse('4015746041').e164)
  end

  it 'carrier should be present' do
    device.carrier = nil
    expect(device).to_not be_valid
  end
end
