require 'rails_helper'
RSpec.describe SplaydJob, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:splayd_job) { SplaydJob.new(job_id: job.id, splayd_id: splayd.id) }

  context 'Creation of a valid actions' do
    it 'is valid' do
      expect(splayd_job).to be_valid
    end

    it 'successfully completes' do
      assert splayd_job.save
    end
  end
end
