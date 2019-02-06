require 'rails_helper'

RSpec.describe SplaydAvailability, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  context 'Creation of a SplaydAvailability with attribute absence' do
    it 'is not valid as is' do
      spa = SplaydAvailability.new
      expect(spa).not_to be_valid
    end
  end
end
