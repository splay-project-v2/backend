require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(email: 'foo@bar.com', password: 'anicepassword09', username: 'TheFooBar') }

  context 'Creation of a valid user' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'generates a non-admin user' do
      expect(user.admin).to be(0)
    end
  end
end
