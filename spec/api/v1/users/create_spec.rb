require 'rails_helper'

RSpec.describe 'User registration', type: :request do
  let!(:user) { User.create(email: 'bob@gmail.com', username: 'BobFoo', password: 'password') }
  context 'with valid credentials' do
    it 'should return a JWT' do
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
    it 'should return a 422 unprocessable entity' do
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
    it 'should return a 422 unprocessable entity' do
      post(
        '/api/v1/users',
        params: request_body('alice@gmail', 'alice', 'password', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 422
      expect(response_body).to include('errors')
    end
  end

  context 'with already existing user mail' do
    it 'should return a 422 unprocessable entity' do
      post(
        '/api/v1/users',
        params: request_body('bob@gmail', 'BobFoo', 'password', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 422
      expect(response_body).to include('errors')
    end
  end

  context 'with already existing user username' do
    it 'should return a 422 unprocessable entity' do
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

  def request_body(email, username, password, password_conf)
    {
      'data': {
          'type': 'user',
          'attributes': {
              'email': email,
              'username': username,
              'password': password,
              'password_confirmation': password_conf
          }
      }
    }.to_json
  end
end
