class UpdateAndRescheduleSearch
  include Service
  include Virtus.model

  attribute :id, Integer
  attribute :account, Account
  attribute :params, Hash

  def call
    saved_search = SavedSearch.find(id)
    reschedule(saved_search) if saved_search.update(params)
    saved_search
  end

  def reschedule(saved_search)
    schedulable_search = SchedulableSearch.new(saved_search)
    if schedulable_search.requires_rescheduling?
      schedulable_search.reschedule!
    end
  end
end
