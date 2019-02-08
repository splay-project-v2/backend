require 'rails_helper'

RSpec.describe 'Jobs creation', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd1) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:splayd2) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }

  context 'request minimal valid job with a valid token' do
    it 'completes and returns target job infos' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      post '/api/v1/jobs', params: minimal_request_body(file_fixture('cyclon.lua').read), headers: headers
      expect(response.status).to eq 200
    end
  end

  context 'request maximal valid job with a valid token' do
    it 'completes and returns target job infos' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      post(
        '/api/v1/jobs',
        params: maximal_request_body(file_fixture('cyclon.lua').read, 1, 'Cyclon', 'Best algo'),
        headers: headers
      )
      expect(response.status).to eq 200
    end
  end

  context 'request job with too many splayds with valid token' do
    it 'does somethings' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      post(
        '/api/v1/jobs',
        params: maximal_request_body(file_fixture('cyclon.lua').read, 10, 'Cyclon', 'Best algo'),
        headers: headers
      )
      expect(response.status).to eq 200
    end
  end

  context 'request with invalid params and valid token' do
    it 'returns a 400 bad request' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      post '/api/v1/jobs', params: 'invalid_params', headers: headers
      expect(response.status).to eq 400
    end
  end

  context 'request without token' do
    it 'returns a 401 unauthorized response' do
      post '/api/v1/jobs'
      expect(response.status).to eq 401
    end
  end

  context 'request with forged token' do
    it 'returns a 401 unauthorized response' do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = 'Bearer ezhfjeoihf456789'
      post '/api/v1/jobs', headers: headers
      expect(response.status).to eq 401
    end
  end

  private

  def minimal_request_body(code)
    {
      'data': {
        'type': 'user',
        'attributes': {
          'code': code
        }
      }
    }.to_json
  end

  def maximal_request_body(code, nb_splayds, name, description)
    {
      'data': {
        'type': 'user',
        'attributes': {
          name: name,
          description: description,
          nb_splayds: nb_splayds,
          code: code
        }
      }
    }.to_json
  end
end
