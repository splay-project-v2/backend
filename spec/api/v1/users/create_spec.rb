require 'rails_helper'

RSpec.describe 'User registration', type: :request do
  context 'with valid credentials' do
    it 'returns a JWT' do
      post(
        '/api/v1/users',
        params: request_body('alice@gmail.com', 'alice', 'password', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 200
      expect(response_body).to include('token')
    end
  end

  context 'with bad passwords' do
    it 'returns a 422 unprocessable entity' do
      post(
        '/api/v1/users',
        params: request_body('alice@gmail.com', 'alice', 'password', 'passwooords'),
        headers: request_headers
      )
      expect(response.status).to eq 422
      expect(response_body).to include('errors')
    end
  end

  context 'with bad email' do
    it 'returns a 422 unprocessable entity' do
      post(
        '/api/v1/users',
        params: request_body('alice@gmail', 'alice', 'password', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 422
      expect(response_body).to include('errors')
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end

  def request_body(email, login, password, password_conf)
    {
      'data': {
          'type': 'user',
          'attributes': {
              'email': email,
              'login': login,
              'password': password,
              'password_confirmation': password_conf
          }
      }
    }.to_json
  end
end
