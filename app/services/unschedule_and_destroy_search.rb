class UnscheduleAndDestroySearch
  include Service
  include Virtus.model

  attribute :account, Account
  attribute :id, Integer

  def call
    SavedSearch.destroy(id)
  end
end
