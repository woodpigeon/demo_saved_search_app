#
class SavedSearchesController < ApplicationController
  def index
    @saved_searches = SavedSearch.all
  end

  def new
    @saved_search = SavedSearch.new
  end

  def create
    @saved_search = CreateAndScheduleSearch.call(account: nil,
                                                 params: saved_search_params)
    if @saved_search.valid?
      redirect_to saved_searches_path, notice: 'Search saved'
    else
      render :new
    end
  end

  def edit
    @saved_search = SavedSearch.find(params[:id])
  end

  def update
    @saved_search = UpdateAndRescheduleSearch.call(id: params[:id],
                                                   account: nil,
                                                   params: saved_search_params)
    if @saved_search.valid?
      redirect_to saved_searches_path, notice: 'Search updated and rescheduled'
    else
      render :edit
    end
  end

  def destroy
    UnscheduleAndDestroySearch.call(account: nil, id: params[:id])
    redirect_to saved_searches_path, notice: 'Search deleted'
  end

  private

  def saved_search_params
    params.require(:saved_search).permit([:name, :interval, :period])
  end
end
