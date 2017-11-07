require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let!(:first_user) {User.create!(handle: "iamatest", email: "iama@test.com", password: "testpass", password_confirmation: "testpass")}

  describe "POST#create" do
    it "should log valid user in and redirect user" do

      post_json = {session: { login: "iamatest", password: "testpass" }}

      post :create, params: post_json

      expect(response.status).to eq 302
    end
    it "should not log valid user in and redirect" do

      post_json = {session: { login: "faker", password: "notreal" }}

      post :create, params: post_json

      expect(flash[:alert]).to eq "Invalid email/username & password combination."
      expect(response.status).to eq 302
    end
  end
end
