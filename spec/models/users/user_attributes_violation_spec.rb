require 'rails_helper'

RSpec.describe User, type: :model do
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
end
