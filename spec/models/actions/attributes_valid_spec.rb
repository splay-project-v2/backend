require 'rails_helper'

RSpec.describe Action, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:actions) { Action.new(job_id: job.id, splayd_id: splayd.id) }

  context 'Creation of a valid actions' do
    it 'is valid' do
      expect(action).to be_valid
    end

    it 'successfully completes' do
      assert action.save
    end
  end
end
