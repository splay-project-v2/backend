require 'rails_helper'

RSpec.describe JobMandatorySplayd, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  context 'Creation of a JobMandatorySplayd with attributes absence' do
    it 'is not valid as is ' do
      jms = JobMandatorySplayd.new
      expect(jms).not_to be_valid
    end

    it 'is not valid without splayd' do
      jms = JobMandatorySplayd.new(job_id: job.id)
      expect(jms).not_to be_valid
    end

    it 'is not valid without job' do
      jms = JobMandatorySplayd.new(splayd_id: splayd.id)
      expect(jms).not_to be_valid
    end
  end
end
