require 'rails_helper'

RSpec.describe SavedSearch, type: :model do
  it { should belong_to :account }
  it { should validate_presence_of :name }
end
