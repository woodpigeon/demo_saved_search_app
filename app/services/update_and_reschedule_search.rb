class UpdateAndRescheduleSearch
  include Service
  include Virtus.model

  attribute :id, Integer
  attribute :account, Account
  attribute :params, Hash

  def call
    saved_search = SavedSearch.find(id)
    if saved_search.update(params)
      # TODO: remove and re-add schedule if either interval or period changed
      # TODO: pass in a service to expose the rescheduling?
    end
    saved_search
  end
end
