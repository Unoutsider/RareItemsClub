require 'rails_helper'

RSpec.describe "OrderDestroys", type: :request do
  describe "GET /destroy" do
    it "returns http success" do
      get "/order_destroy/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
