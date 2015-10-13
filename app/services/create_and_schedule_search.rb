#
# See Rufus every syntax
#
class CreateAndScheduleSearch
  include ::Service
  include Virtus.model

  attribute :account, Account
  attribute :params, Hash

  # create and schedule
  def call
    saved_search = SavedSearch.new(params)
    if saved_search.update(params)
      # create schedule
    end
    saved_search # valid? will be false if there was a problem saving
  end
end
