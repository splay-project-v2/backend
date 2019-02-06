require 'rails_helper'

RSpec.describe LocalLog, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  context 'Creation of a LocalLog with attributes absence' do
    it 'is not valid as is ' do
      local_log = LocalLog.new
      expect(local_log).not_to be_valid
    end

    it 'is not valid without splayd' do
      local_log = LocalLog.new(job_id: job.id)
      expect(local_log).not_to be_valid
    end

    it 'is not valid without job' do
      local_log = LocalLog.new(splayd_id: splayd.id)
      expect(local_log).not_to be_valid
    end
  end
end
