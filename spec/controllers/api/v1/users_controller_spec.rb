require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "POST#create" do
    it "should return errors if sent data is invalid" do

      post_json = {
        handle: "",
        email: "",
        password: "",
        password_confirmation: ""
      }.to_json

      post :create, body: post_json

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["error"]).to be_kind_of(Hash)
      expect(returned_json["error"].length).to eq 3

      expect(returned_json["error"]["password"]).to be_kind_of(Array)
      expect(returned_json["error"]["email"]).to be_kind_of(Array)
      expect(returned_json["error"]["handle"]).to be_kind_of(Array)

      expect(returned_json["error"]["password"].length).to eq 1
      expect(returned_json["error"]["email"].length).to eq 2
      expect(returned_json["error"]["handle"].length).to eq 3
    end
  end
  describe "POST#create" do
    it "should return user if sent data is valid" do

      post_json = {
        handle: "rspectest",
        email: "rspec@test.com",
        password: "123456",
        password_confirmation: "123456"
      }.to_json

      post :create, body: post_json

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 201
      expect(returned_json).to be_kind_of(Hash)
    end
  end
end
