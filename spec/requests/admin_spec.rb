require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /item_create" do
    it "returns http success" do
      get "/admin/item_create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /orders_show" do
    it "returns http success" do
      get "/admin/orders_show"
      expect(response).to have_http_status(:success)
    end
  end

end
