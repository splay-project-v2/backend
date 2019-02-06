require 'rails_helper'

RSpec.describe BlacklistHost, type: :model do
  let!(:bk) { BlacklistHost.new(host: '192.168.1.1') }
  context 'Creation of a valid BlacklistHost' do
    it 'is valid' do
      expect(bk).to be_valid
    end

    it 'successfully completes' do
      assert bk.save
    end
  end
end
