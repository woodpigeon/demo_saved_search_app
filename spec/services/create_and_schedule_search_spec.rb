require 'rails_helper'

RSpec.describe CreateAndScheduleSearch, type: :service do

  describe '#call' do 
    let(:account) { nil }
    let(:good_params) { { name: 'something', interval: 2, period: 'day'}}
    let(:bad_params) { { name: 'something', interval: 0, period: 'month'}}

    it 'creates a saved_search and schedules it when inputs valid are valid' do
      expect_any_instance_of(SchedulableSearch).to receive(:schedule!)
      saved_search = described_class.call(account: account, params: good_params)
      expect(saved_search).to_not be_nil
      expect(saved_search).to be_valid
    end

    it 'does not schedule the search if inputs are invalid' do 
      expect_any_instance_of(SchedulableSearch).to_not receive(:schedule!)
      saved_search = described_class.call(account: account, params: bad_params)
      expect(saved_search).to_not be_nil
      expect(saved_search).to_not be_valid
    end
  end
end