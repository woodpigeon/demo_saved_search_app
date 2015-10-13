class UnscheduleAndDestroySearch
  include Service
  include Virtus.model

  attribute :account, Account
  attribute :id, Integer

  def call
    saved_search = SavedSearch.find(id)
    SchedulableSearch.new(saved_search).unschedule!
    saved_search.destroy!
  end
end
