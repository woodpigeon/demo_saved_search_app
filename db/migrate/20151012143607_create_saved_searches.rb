class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.string :name, index: true
      t.string :query
      t.string :every
      t.references :user, index: true

      t.timestamps null: false
    end
    
  end
end
