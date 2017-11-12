require "rails_helper"

RSpec.describe Api::V1::SubmissionsController, type: :controller do

  let!(:first_user) {FactoryGirl.create(:user)}
  let!(:first_survey) {FactoryGirl.create(:survey)}

  describe "POST#create" do
    it "should return error message if user is not signed in" do

      question1 = FactoryGirl.create(:question, survey: first_survey)
      choice1 = FactoryGirl.create(:choice, question: question1)
      choice2 = FactoryGirl.create(:choice, question: question1)

      post_json = {
        "#{question1.id}": "#{choice1.id}"
      }.to_json

      post :create, body: post_json

      returned_json = JSON.parse(response.body)

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["messages"]).to be_kind_of(Hash)
      expect(returned_json["messages"]).to eq "please" => ["sign in"]
    end

    it "should return success message if submission is successful" do

      session[:user_id] = first_user.id

      question1 = FactoryGirl.create(:question, survey: first_survey)
      choice1 = FactoryGirl.create(:choice, question: question1)
      choice2 = FactoryGirl.create(:choice, question: question1)

      post_json = {
        payload: {"#{question1.id}": "#{choice1.id}"}
      }.to_json

      expect{ post :create, body: post_json}.to change{ Submission.count }.by(1)

      returned_json = JSON.parse(response.body)
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["messages"]).to be_kind_of(Hash)
      expect(returned_json["messages"]).to eq "submission" => ["successful"]

    end
  end


end
