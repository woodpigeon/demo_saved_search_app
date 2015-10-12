class SavedSearch < ActiveRecord::Base
  belongs_to :account
  validates :name, presence: true, uniqueness: { scope: :account }
  validates :interval, presence: true, numericality: { greater_than: 0 }
  validates :period, presence: true
  enum period: [:month, :week, :day, :hour]
end
