require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before do
      get '/users/'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include("Here is a single Post for a given user you are in '/users'")
    end
  end

  describe 'GET /show' do
    before do
      get '/users/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render show' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include("Here is a single Post for a given user you are in '/users/user_id")
    end
  end
end
