require 'rails_helper'

RSpec.describe Splayd, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }

  context 'Creation of job with attributes absence' do
    it 'is not valid without as is' do
      splayd = Splayd.new
      expect(splayd).not_to be_valid
    end

    it 'is not valid with absence of user_id' do
      splayd = Splayd.new(key: 'fuzz')
      expect(splayd).not_to be_valid
    end

    it 'is not valid with absence of key' do
      splayd = Splayd.new(user_id: user.id)
      expect(splayd).not_to be_valid
    end
  end
end
