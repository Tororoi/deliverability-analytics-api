# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/api' do
    # Create a new device in the database
    post 'register', to: 'devices#register'
    # Create a new heartbeat associated with device
    post 'alive', to: 'devices#alive'
    # Create a new report associated with device
    post 'report', to: 'devices#report'
    # Update device as disabled with timestamp
    patch 'terminate', to: 'devices#terminate'
  end
end
