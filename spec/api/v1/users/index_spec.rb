require 'rails_helper'

RSpec.describe 'Users index', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'bob@gmail.com', username: 'BobFoo', password: 'password') }
  let!(:admin) { User.create(email: 'alice@gmail.com', username: 'AliceFoo', password: 'password', admin: 1) }
  let!(:jwt) { JWT.encode({ 'id': admin.id, 'username': admin.username }, secret, 'HS256') }
  let!(:user_jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }
  let!(:user_count) { User.count }

  context 'request with a valid admin token' do
    it 'returns all Users infos' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get '/api/v1/users', headers: headers
      expect(response.status).to eq 200
      expect(response_body).to include('users')
    end
  end

  context 'request with a simple user token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{user_jwt}"
      get '/api/v1/users', headers: headers
      expect(response.status).to eq 401
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      get '/api/v1/users'
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      get '/api/v1/users', headers: headers
      expect(response.status).to eq 401
    end
  end
end
