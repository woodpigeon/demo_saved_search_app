class SavedSearch < ActiveRecord::Base
  belongs_to :account
  validates :name, presence: true
  validates :interval, presence: true, numericality: true
  validates :period, presence: true
  enum period: [:month, :week, :day, :hour]
end
