require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creation of a valid user' do
    it 'is valid' do
      user = User.new(email: 'foo@bar.com', password: 'foobarbaz')
      expect(user).to be_valid
    end
  end
end
