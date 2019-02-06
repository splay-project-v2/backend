require 'rails_helper'

RSpec.describe Action, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }

  context 'Creation an action with attributes absence' do
    it 'is not valid without as is' do
      action = Action.new
      expect(action).not_to be_valid
    end

    it 'is not valid with absence of splayd_id' do
      action = Action.new(splayd_id: splayd.id)
      expect(action).not_to be_valid
    end

    it 'is not valid with absence of job_id' do
      action = Action.new(job_id: job.id)
      expect(action).not_to be_valid
    end
  end
end
