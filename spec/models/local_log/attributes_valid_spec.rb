require 'rails_helper'

RSpec.describe LocalLog, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:local_log) { LocalLog.new(splayd_id: splayd.id, job_id: job.id) }
  context 'Creation of a valid LocalLog' do
    it 'is valid' do
      expect(local_log).to be_valid
    end

    it 'successfully completes' do
      assert local_log.save
    end
  end
end
