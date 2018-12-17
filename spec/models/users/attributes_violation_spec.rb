require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(email: 'foo@bar.com', password: 'anicepassword09', login: 'TheFooBar') }

  context 'Creation of user with attributes violation' do
    it 'is not valid with a too short password' do
      user.password = '2smal'
      expect(user).not_to be_valid
    end

    it 'is not valid with a invalid email address' do
      user.email = 'foo@b'
      expect(user).not_to be_valid
      user.email = 'foo@'
      expect(user).not_to be_valid
      user.email = 'foo'
      expect(user).not_to be_valid
    end

    it 'is not valid with a invalid login' do
      user.login = 'Fo'
      expect(user).not_to be_valid
      user.login = 'thisloginisreallytoolongfortheapplication'
      expect(user).not_to be_valid
    end
  end
end
