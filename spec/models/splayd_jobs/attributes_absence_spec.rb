require 'rails_helper'
RSpec.describe SplaydJob, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }

  context 'Creation of SplaydJob with attributes absence' do
    it 'is not valid without as is' do
      splayd_job = SplaydJob.new
      expect(splayd_job).not_to be_valid
    end

    it 'is not valid with absence of splayd_id' do
      splayd_job = SplaydJob.new(splayd_id: splayd.id)
      expect(splayd_job).not_to be_valid
    end

    it 'is not valid with absence of job_id' do
      splayd_job = SplaydJob.new(job_id: job.id)
      expect(splayd_job).not_to be_valid
    end
  end
end
