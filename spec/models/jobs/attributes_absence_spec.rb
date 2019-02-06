require 'rails_helper'

RSpec.describe Job, type: :model do
  let!(:user) { User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice') }

  context 'Creation of job with attributes absence' do
    it 'is not valid with blank job' do
      job = Job.new
      expect(job).not_to be_valid
    end

    it 'is not valid with absence of user_id' do
      job = Job.new(code: file_fixture('cyclon.lua').read)
      expect(job).not_to be_valid
    end

    it 'is not valid with absence of code' do
      job = Job.new(user_id: user.id)
      expect(job).not_to be_valid
    end
  end
end
