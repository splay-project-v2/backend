require 'rails_helper'

RSpec.describe 'Session creation', type: :request do
  let!(:user) { User.create(email: 'alice@gmail.com', username: 'AliceFoo', password: 'password') }

  context 'with valid credentials' do
    it 'should return a json web token' do
      post(
        '/api/v1/sessions',
        params: request_body('AliceFoo', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 200
    end
  end

  context 'with valid unsensitive credentials' do
    it 'should return a json web token' do
      post(
        '/api/v1/sessions',
        params: request_body('alicefoo', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 200
    end
  end

  context 'with bad credentials' do
    it 'should return 401 unauthorized' do
      post(
        '/api/v1/sessions',
        params: request_body('AliceFoo', 'foobar'),
        headers: request_headers
      )
      expect(response.status).to eq 401
    end
  end

  context 'with non-existant user' do
    it 'should return 401 unauthorized' do
      post(
        '/api/v1/sessions',
        params: request_body('RemyVoet', 'foobar'),
        headers: request_headers
      )
      expect(response.status).to eq 401
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end

  def request_body(username, password)
    {
      'data': {
        'type': 'session',
        'attributes': {
          'username': username,
          'password': password
        }
      }
    }.to_json
  end
end
