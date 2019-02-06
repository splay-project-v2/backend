require 'rails_helper'

RSpec.describe Job, type: :model do
  let!(:job) { Job.new }

  context 'Job method format_code' do
    it 'gives blank on empty code' do
      job.format_code
      expect(job.code).to eq('')
    end

    it 'add slashes on code' do
      job.code = file_fixture('example.lua').read
      job.format_code
      expect(job.code).to eq(formatted_example)
    end
  end

  private

  def formatted_example
    "function receive_set(rec_set)\n  local sent_set = misc.random_pick(neighbours, shuffle_length)"\
    "\n  cyclon_insert(rec_set, sent_set)\n  return sent_set\nend"
  end
end
