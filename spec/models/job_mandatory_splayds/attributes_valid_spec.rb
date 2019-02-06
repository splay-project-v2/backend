require 'rails_helper'

RSpec.describe JobMandatorySplayd, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:jms) { JobMandatorySplayd.new(splayd_id: splayd.id, job_id: job.id) }
  context 'Creation of a valid JobMandatorySplayd' do
    it 'is valid' do
      expect(jms).to be_valid
    end

    it 'successfully completes' do
      assert jms.save
    end
  end
end
