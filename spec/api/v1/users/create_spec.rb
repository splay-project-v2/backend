require 'rails_helper'

RSpec.describe 'User registration', type: :request do
  let!(:user) { User.create(email: 'bob@gmail.com', username: 'BobFoo', password: 'password') }
  let!(:user_count) { User.count }
  context 'with valid credentials' do
    before(:each) do
      post(
        '/api/v1/users',
        params: request_body('alice@gmail.com', 'alice', 'password', 'password'),
        headers: request_headers
      )
    end
    it 'should succeed' do
      expect(response.status).to eq 200
    end
    it 'should return a JWT' do
      expect(response_body).to include('token')
    end
    it 'should create a new user in DB' do
      expect(User.count).to be > user_count
    end
    it 'should create a non-admin user' do
      expect(user.admin).to eq 0
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
