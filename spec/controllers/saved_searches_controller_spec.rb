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
      expect(response).to redirect_to(saved_searches_url)
    end
  
    it 'should render :new template if on unsuccessful save' do
      expect_any_instance_of(SavedSearch).to receive(:valid?).and_return(false)
      post :create, saved_search: { name: 'something' }
      expect(flash[:notice]).to be_nil
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      saved_search = SavedSearch.create(name: 'A', interval: 1, period: 'month')
      get :edit, id: saved_search.id
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:success)
      expect(assigns(:saved_search)).to eq(saved_search)
    end
  end

  describe 'PATCH #update' do
    let!(:saved_search) { SavedSearch.create(name: 'A', interval: 1, period: 'month') }
    let!(:updated_attrs) { { name: 'B', interval: 2, period: 'week' } }

    it 'should render redirect to index after successful update' do
      expect_any_instance_of(SavedSearch).to receive(:valid?).and_return(true)
      patch :update, id: saved_search.id, saved_search: updated_attrs
      expect(response).to redirect_to(saved_searches_url)
    end

    it 'should render render edit after unsuccessful update' do
      expect_any_instance_of(SavedSearch).to receive(:valid?).and_return(false)
      patch :update, id: saved_search.id, saved_search: updated_attrs
      expect(response).to render_template(:edit)
    end
  end
end
