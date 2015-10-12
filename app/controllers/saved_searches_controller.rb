class SavedSearchesController < ApplicationController
  def index
  end

  def new
    @saved_search = SavedSearch.new
  end
end
