require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "Accessing home page" do
    it 'should return success' do   #
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Accessing about page" do
    it 'should return success' do   #
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
