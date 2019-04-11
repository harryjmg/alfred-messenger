require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index without being admin" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
