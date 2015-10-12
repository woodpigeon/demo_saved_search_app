#
#
#
class SavedSearchesController < ApplicationController
  def index
    @saved_searches = SavedSearch.all
  end

  def new
    @saved_search = SavedSearch.new
  end

  def create
    @saved_search = SavedSearch.new(saved_search_params)
    if @saved_search.save
      redirect_to saved_searches_path, notice: 'Search saved'
    else
      render :new
    end
  end

  private

  def saved_search_params
    params.require(:saved_search).permit([:name, :interval, :period])
  end
end
