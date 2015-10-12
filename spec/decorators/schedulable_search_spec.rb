require 'rails_helper'

RSpec.describe SchedulableSearch, type: :model do
  describe "#every" do 
    subject { SchedulableSearch.new(saved_search) }
    describe 'monthly' do 
      let(:saved_search) { SavedSearch.new( interval: 12, period: 'month') }
      it "converts interval and period correctly" do 
        expect(subject.every).to eq('12M')
      end
    end
    describe 'weekly' do 
      let(:saved_search) { SavedSearch.new( interval: 12, period: 'week') }
      it "converts interval and period correctly" do 
        expect(subject.every).to eq('12w')
      end
    end
    describe 'daily' do 
      let(:saved_search) { SavedSearch.new( interval: 12, period: 'day') }
      it "converts interval and period correctly" do 
        expect(subject.every).to eq('12d')
      end
    end
    describe 'hourly' do 
      let(:saved_search) { SavedSearch.new( interval: 9, period: 'hour') }
      it "converts interval and period correctly" do 
        expect(subject.every).to eq('9h')
      end
    end
  end
end
