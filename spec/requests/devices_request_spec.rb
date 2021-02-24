# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Devices', type: :request do
  describe 'POST register' do
    # Validations
    it 'valid device returns http success' do
      post api_register_url, params: { phone_number: '+14015746041', carrier: 'Carrier' }
      expect(response).to have_http_status(201)
    end

    # Doesn't belong in request spec?
    # it 'phone number is reformatted to e164' do
    #   post api_register_url, params: { phone_number: '4015746041', carrier: 'Verizon' }
    #   expect(JSON.parse(response.body)["device"]["phone_number"]).to eq(Phonelib.parse('4015746041').e164)
    # end

    it 'no phone number returns error' do
      post api_register_url, params: { carrier: 'Carrier' }
      expect(response).to have_http_status(500)
    end

    it 'no carrier returns error' do
      post api_register_url, params: { phone_number: '+14015746041' }
      expect(response).to have_http_status(500)
    end
  end

  describe 'PATCH terminate' do
    before :each do
      @device = Device.create(phone_number: '+14015746041', carrier: 'Carrier')
      @disableddevice = Device.create(phone_number: '+14015746041', carrier: 'Carrier', disabled_at: DateTime.now)
    end

    it 'valid id returns http success' do
        patch api_terminate_url, params: { id: @device.id }
        expect(response).to have_http_status(200)
    end

    it 'invalid id returns error' do
        patch api_terminate_url, params: { id: 1 }
        expect(response).to have_http_status(500)
        expect(JSON.parse(response.body)["error"]).to eq("Device ID does not exist")
    end

    it 'device already disabled returns error' do
        patch api_terminate_url, params: { id: @disableddevice.id }
        expect(response).to have_http_status(500)
        expect(JSON.parse(response.body)["error"]).to eq("Device is already disabled")
    end
  end

  describe 'POST alive' do
    before :each do
        @device = Device.create(phone_number: '+14015746041', carrier: 'Carrier')
        @disableddevice = Device.create(phone_number: '+14015746041', carrier: 'Carrier', disabled_at: DateTime.now)
    end

    it 'valid id returns http success' do
        post api_alive_url, params: { id: @device.id }
        expect(response).to have_http_status(201)
    end

    it 'invalid id returns error' do
        post api_alive_url, params: { id: 1 }
        expect(response).to have_http_status(500)
        expect(JSON.parse(response.body)["error"]).to eq("Device ID does not exist")
    end

    it 'device already disabled returns error' do
        post api_alive_url, params: { id: @disableddevice.id }
        expect(response).to have_http_status(500)
    end
  end

end
