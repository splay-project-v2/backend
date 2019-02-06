require 'rails_helper'
RSpec.describe SplaydSelection, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }
  let!(:splayd) { Splayd.create(user_id: user.id, key: 'key') }
  let!(:job) { Job.create(user_id: user.id, code: file_fixture('cyclon.lua').read) }
  let!(:splayd_selection) { SplaydSelection.new(job_id: job.id, splayd_id: splayd.id) }

  context 'Creation of a valid SplaydSelection' do
    it 'is valid' do
      expect(splayd_selection).to be_valid
    end

    it 'successfully completes' do
      assert splayd_selection.save
    end
  end
end
