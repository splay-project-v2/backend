require 'rails_helper'

RSpec.describe 'Jobs deletion', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }

  context 'request valid job with a valid token' do
    before(:each) do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      delete "/api/v1/jobs/#{job.id}", headers: headers
    end

    it 'returns a success HTTP code' do
      expect(response.status).to eq 200
    end

    it 'set kill to the selected job' do
      expect(Job.find_by(id: job.id).command).to eq 'KILL'
    end
  end

  context 'request unexisting job with a valid token' do
    it 'returns a 404 not found' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      delete '/api/v1/jobs/42', headers: headers
      expect(response.status).to eq 404
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      delete "/api/v1/jobs/#{job.id}"
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      delete "/api/v1/jobs/#{job.id}", headers: headers
      expect(response.status).to eq 401
    end
  end
end
