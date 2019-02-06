require 'rails_helper'

RSpec.describe SplaydAvailability, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:spa) { SplaydAvailability.new(splayd_id: splayd.id) }
  context 'Creation of a valid SplaydAvailability' do
    it 'is valid' do
      expect(spa).to be_valid
    end

    it 'successfully completes' do
      assert spa.save
    end
  end
end
