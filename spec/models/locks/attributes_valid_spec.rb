require 'rails_helper'
RSpec.describe Lock, type: :model do
  let!(:lock) { Lock.new }
  context 'Creation of a valid Lock' do
    it 'is valid' do
      expect(lock).to be_valid
    end
  end
end