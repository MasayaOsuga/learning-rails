require 'rails_helper'

RSpec.describe "Pings", type: :request do
  describe "GET /index" do
    before do
      get "/ping"
    end

  it "returns 200" do
    expect(response).to have_http_status(200)
    end

    it "returns PONG" do
      json = JSON.parse(response.body)
      expect(json['messages']).to eq('PONG')
    end
  end
end
