require "rails_helper"

RSpec.describe Api::V1::ChartsController, type: :controller do
  let!(:first_user) {FactoryGirl.create(:user)}
  let!(:first_survey) {FactoryGirl.create(:survey)}

  describe "GET#index" do
    it "should return a hash with survey submission data" do

      question1 = FactoryGirl.create(:question, survey: first_survey)
      choice1 = FactoryGirl.create(:choice, question: question1)
      choice2 = FactoryGirl.create(:choice, question: question1)
      submission1 = Submission.create(user: first_user, question: question1, answer: choice1.id)

      get :index

      returned_json = JSON.parse(response.body)

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["name"]).to eq "surveys"
      expect(returned_json["children"]).to be_kind_of(Array)

      expect(returned_json["children"][0]).to be_kind_of(Hash)
      expect(returned_json["children"][0]["name"]).to eq first_survey.title
      expect(returned_json["children"][0]["children"]).to be_kind_of(Array)
      expect(returned_json["children"][0]["children"][0]).to be_kind_of(Hash)
      expect(returned_json["children"][0]["children"][0]["name"]).to eq question1.short
      expect(returned_json["children"][0]["children"][0]["children"]).to be_kind_of(Array)
      expect(returned_json["children"][0]["children"][0]["children"][0]).to be_kind_of(Hash)
      expect(returned_json["children"][0]["children"][0]["children"][0]["name"]).to eq choice1.short
      expect(returned_json["children"][0]["children"][0]["children"][0]["size"]).to eq Submission.where(user: first_user, question: question1, answer: choice1.id).count*750

    end
  end
end
