# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/api' do
    post 'register', to: 'devices#register'
    post 'alive', to: 'devices#alive'
    post 'report', to: 'devices#report'
    patch 'terminate', to: 'devices#terminate'
  end
end
