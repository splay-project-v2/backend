require 'rails_helper'

RSpec.describe 'Session creation', type: :request do
  let!(:user) { User.create(email: 'alice@gmail.com', login: 'AliceFoo', password: 'password') }

  context 'with valid credentials' do
    it 'should return a json web token' do
      post(
        '/api/v1/sessions',
        params: request_body('alice@gmail.com', 'password'),
        headers: request_headers
      )
      expect(response.status).to eq 200
    end
  end

  context 'with bad credentials' do
    it 'should return 401 unauthorized' do
      post(
        '/api/v1/sessions',
        params: request_body('alice@gmail.com', 'foobar'),
        headers: request_headers
      )
      expect(response.status).to eq 401
    end
  end

  context 'with non-existant user' do
    it 'should return 401 unauthorized' do
      post(
        '/api/v1/sessions',
        params: request_body('bob@gmail.com', 'foobar'),
        headers: request_headers
      )
      expect(response.status).to eq 401
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end

  def request_body(email, password)
    {
        'data': {
            'type': 'session',
            'attributes': {
                'email': email,
                'password': password
            }
        }
    }.to_json
  end
end
