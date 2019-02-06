require 'rails_helper'

RSpec.describe Splayd, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) do
    Splayd.new(
      user_id: user.id,
      key: 'key'
    )
  end

  context 'Creation of a valid splayd' do
    it 'is valid' do
      expect(splayd).to be_valid
    end
  end
end
