require 'rails_helper'

RSpec.describe Job, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd1) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) do
    Job.new(
      user_id: user.id,
      code: file_fixture('cyclon.lua').read
    )
  end

  context 'Creation of a valid job' do
    it 'is valid' do
      expect(job).to be_valid
    end

    it 'successfully completes' do
      assert job.save
    end
  end
end
