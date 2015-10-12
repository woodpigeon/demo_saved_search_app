require 'rails_helper'

RSpec.describe SavedSearchesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:saved_searches)).to_not be_nil
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:saved_search)).to be_a_new(SavedSearch)
    end
  end

  describe 'POST #create' do
    it 'should redirect to index on successful save' do
      expect_any_instance_of(SavedSearch).to receive(:valid?).and_return(true)
      post :create, saved_search: { name: 'something' }
      expect(flash[:notice]).to_not be_nil
      response.should redirect_to(saved_searches_url)
    end
  end

  describe 'POST #create' do
    it 'should redirect to index on successful save' do
      expect_any_instance_of(SavedSearch).to receive(:valid?).and_return(false)
      post :create, saved_search: { name: 'something' }
      expect(flash[:notice]).to be_nil
      response.should render_template(:new)
    end
  end
end
