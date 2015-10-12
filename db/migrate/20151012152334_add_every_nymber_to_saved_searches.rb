class AddEveryNymberToSavedSearches < ActiveRecord::Migration
  def up
    remove_column :saved_searches, :every
    add_column :saved_searches, :interval, :integer, default: 1, null: false
    add_column :saved_searches, :period, :integer, default: 0, null: false # rails enum ie 0 = month
  end

  def down
    remove_column :saved_searches, :interval
    remove_column :saved_searches, :period
  end
end
