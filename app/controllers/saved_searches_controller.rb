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

  def edit
    @saved_search = SavedSearch.find(params[:id])
  end

  def update
    @saved_search = SavedSearch.find(params[:id])
    if @saved_search.update(saved_search_params)
      redirect_to saved_searches_path, notice: 'Search updated'
    else
      render :edit
    end
  end

  private

  def saved_search_params
    params.require(:saved_search).permit([:name, :interval, :period])
  end
end
