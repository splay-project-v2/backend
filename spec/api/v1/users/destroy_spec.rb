require 'rails_helper'

RSpec.describe 'User destroy', type: :request do
  let!(:secret) { Rails.application.credentials.jwt_secret }
  let!(:user) { User.create(email: 'bob@gmail.com', username: 'BobFoo', password: 'password') }
  let!(:admin) { User.create(email: 'alice@gmail.com', username: 'AliceFoo', password: 'password', admin: 1) }
  let!(:jwt) { JWT.encode({ 'id': admin.id, 'username': admin.username }, secret, 'HS256') }
  let!(:user_jwt) { JWT.encode({ 'id': user.id, 'username': user.username }, secret, 'HS256') }
  let!(:user_count) { User.count }
  context 'with admin credentials' do
    before(:each) do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{jwt}"
      delete("/api/v1/users/#{user.id}", headers: headers)
    end
    it 'should succeed' do
      expect(response.status).to eq 200
    end
    it 'should delete user from DB' do
      expect(User.count).to be < user_count
    end
  end

  context 'with user credentials' do
    before(:each) do
      headers = request_headers
      headers[:HTTP_AUTHORIZATION] = "Bearer #{user_jwt}"
      delete("/api/v1/users/#{admin.id}", headers: headers)
    end
    it 'should not succeed and trigger unauthorized' do
      expect(response.status).to eq 401
      expect(User.count).to eq user_count
    end
  end
end
