# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Devices', type: :request do
  describe 'POST register' do
    # Validations
    it 'valid device returns http success' do
      post api_register_url, params: { phone_number: '+15555746041', carrier: 'Verizon' }
      expect(response).to have_http_status(201)
    end

    it 'no carrier returns error' do
      post api_register_url, params: { phone_number: '+15555746041' }
      expect(response).to have_http_status(500)
    end

    it 'no phone number returns error' do
      post api_register_url, params: { carrier: 'Verizon' }
      expect(response).to have_http_status(500)
    end
  end
end
