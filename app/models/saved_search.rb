class SavedSearch < ActiveRecord::Base
  belongs_to :account
  validates :name, presence: true
  validates :every_quantity, presence: true, numericality: true
  validates :every_period, presence: true
  enum periods: [:month, :week, :day, :hour ]
end
