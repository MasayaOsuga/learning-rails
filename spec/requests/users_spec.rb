require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      FactoryBot.create_list(:user,3)
      get "/users"
    end

    it "returns 200" do
      expect(response).to have_http_status(200)
    end

    it "returns all users" do
      users = User.all
      res = JSON.parse(response.body)["users"]
      expect(res).to eq(users.as_json)
    end
  end


  describe "POST /users" do
    describe "when valid" do
      before do
        @params = {
            user: {
              name: "user",
              email: "user@examle.com",
              password: "password"
            }
          }
          post "/users", params: @params
      end
      it "returns 200" do
        expect(response).to have_http_status(200)
      end

      it "creates user" do
        expect(User.count).to eq(1)
      end

      it "returns user" do
        user = User.last
        res = JSON.parse(response.body)["user"]
        expect(res).to eq(user.as_json)
      end
    end
  end

  describe "PATCH /users/:id" do
    describe "when valid" do
      before do
        @user = FactoryBot.create(:user)
        @params = {
          user: {
            name: "new name"
          }
        }
        patch "/users/#{@user[:id]}", params: @params
      end

      it "returns 200" do
        expect(response).to have_http_status(200)
      end

      it "updates user" do
        @user.reload
        expect(@user[:name]).to eq("new name")
      end

      it "returns user" do
        res = JSON.parse(response.body)["user"]
        expect(res["name"]).to eq("new name")
      end
    end
  end


end
