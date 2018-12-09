require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creation of user with attributes absence' do
    it 'is not valid with blank user' do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'is not valid with absence of password' do
      user = User.new(email: 'foo@bar.com')
      expect(user).not_to be_valid
    end

    it 'is not valid with absence of email' do
      user = User.new(password: 'foobarbaz')
      expect(user).not_to be_valid
    end
  end

  context 'Creation of user with attributes violation' do
    it 'is not valid with a too short password' do
      user = User.new(email: 'foo@bar.com', password: '2smal')
      expect(user).not_to be_valid
    end

    it 'is not valid with a invalid email address' do
      user = User.new(email: 'foo@bar', password: 'foobarbaz')
      expect(user).not_to be_valid
    end
  end

  context 'Creation of a valid user' do
    it 'is valid' do
      user = User.new(email: 'foo@bar.com', password: 'foobarbaz')
      expect(user).to be_valid
    end
  end
end
