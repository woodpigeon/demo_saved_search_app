class UnscheduleAndDestroySearch
  include Service
  include Virtus.model

  attribute :account, Account
  attribute :params, Hash

  def call
  end
end
