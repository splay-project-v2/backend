require 'rails_helper'

RSpec.describe 'Logs show', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd1) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:job2) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:splayds) { SplaydSelection.create(splayd_id: splayd1.id, job_id: job.id, selected: 'TRUE') }
  let!(:jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }

  context 'request valid job logs with a valid token but file doesnt exist yet' do
    it 'returns log not available yet info' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get "/api/v1/logs/#{job2.id}", headers: headers
      expect(response.status).to eq 200
      expect(response_body).to include('logs')
    end
  end

  context 'request valid job logs with a valid token' do
    it 'returns target job infos' do
      File.open("/usr/splay/logs/#{job.ref}", 'wb') do |file|
        file << 'My content'
        file << 'More content'
      end
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get "/api/v1/logs/#{job.id}", headers: headers
      expect(response.status).to eq 200
      expect(response_body).to include('logs')
    end
  end

  context 'request unexisting job with a valid token' do
    it 'returns a 404 not found' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      get '/api/v1/logs/42', headers: headers
      expect(response.status).to eq 404
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      get "/api/v1/logs/#{job.id}"
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      get "/api/v1/logs/#{job.id}", headers: headers
      expect(response.status).to eq 401
    end
  end
end
