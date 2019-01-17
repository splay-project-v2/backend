require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creation of user with attributes absence' do
    it 'is not valid with blank user' do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'is not valid with absence of password' do
      user = User.new(email: 'foo@bar.com', username: 'TheFooBar')
      expect(user).not_to be_valid
    end

    it 'is not valid with absence of email' do
      user = User.new(password: 'foobarbaz', username: 'TheFooBar')
      expect(user).not_to be_valid
    end

    it 'is not valid with absence of login' do
      user = User.new(email: 'foo@bar.com', password: 'foobarbaz')
      expect(user).not_to be_valid
    end
  end
end
