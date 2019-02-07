require 'rails_helper'

RSpec.describe 'Jobs index', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua')) }
  let!(:jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }

  context 'request with a valid token' do
    it 'returns all Jobs infos' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get '/api/v1/jobs', headers: headers
      expect(response.status).to eq 200
      expect(response_body).to include('jobs')
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      get '/api/v1/jobs'
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      get '/api/v1/jobs', headers: headers
      expect(response.status).to eq 401
    end
  end
end
