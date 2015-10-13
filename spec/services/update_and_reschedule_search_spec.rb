require 'rails_helper'

RSpec.describe UpdateAndRescheduleSearch, type: :service do

  describe '#call' do 
    let(:account) { nil }
    let(:good_params) { { name: 'something', interval: 2, period: 'day'}}
    let(:bad_params) { { name: 'something', interval: 0, period: 'month'}}

    context 'when only the name has changed' do 
      it 'updates the search name but does not reschedule it' do
        new_name = 'new name'
        saved_search = SavedSearch.create(good_params)
        expect_any_instance_of(SchedulableSearch).to_not receive(:reschedule!)
        
        updated_saved_search = described_class.call(account: account, 
                                                    id: saved_search.id, 
                                                    params: {name: new_name})
        expect(updated_saved_search).to_not be_nil
        expect(updated_saved_search).to be_valid
        expect(updated_saved_search.name).to eq(new_name)
      end
    end

    context 'when interval has changed' do 
      it 'updates the search and reschedules it' do
        new_interval = 999
        saved_search = SavedSearch.create(good_params)
        expect_any_instance_of(SchedulableSearch).to receive(:reschedule!)
        
        updated_saved_search = described_class.call(account: account, 
                                                    id: saved_search.id, 
                                                    params: {interval: new_interval})
        expect(updated_saved_search).to_not be_nil
        expect(updated_saved_search).to be_valid
        expect(updated_saved_search.interval).to eq(new_interval)
      end
    end

    context 'when period has changed' do 
      it 'updates the search and reschedules it' do
        new_period = 'week'
        saved_search = SavedSearch.create(good_params)
        expect_any_instance_of(SchedulableSearch).to receive(:reschedule!)
        
        updated_saved_search = described_class.call(account: account, 
                                                    id: saved_search.id, 
                                                    params: {period: new_period})
        expect(updated_saved_search).to_not be_nil
        expect(updated_saved_search).to be_valid
        expect(updated_saved_search.period).to eq(new_period)
      end
    end
  end
end