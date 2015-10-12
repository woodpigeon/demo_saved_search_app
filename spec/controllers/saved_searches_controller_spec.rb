require 'rails_helper'

RSpec.describe SavedSearchesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:saved_search)).to be_a_new(SavedSearch)
    end
  end

end
