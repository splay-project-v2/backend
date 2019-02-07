require 'rails_helper'

RSpec.describe 'Jobs show', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua')) }
  let!(:jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }

  context 'request valid job with a valid token' do
    it 'returns target job infos' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get "/api/v1/jobs/#{job.id}", headers: headers
      expect(response.status).to eq 200
      expect(response_body).to include('job')
    end
  end

  context 'request unexisting job with a valid token' do
    it 'returns a 404 not found' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get '/api/v1/jobs/42', headers: headers
      expect(response.status).to eq 404
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      get "/api/v1/jobs/#{job.id}"
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      get "/api/v1/jobs/#{job.id}", headers: headers
      expect(response.status).to eq 401
    end
  end
end
