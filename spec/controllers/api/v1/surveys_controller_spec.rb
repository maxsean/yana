require "rails_helper"

RSpec.describe Api::V1::SurveysController, type: :controller do

  let!(:first_survey) {FactoryGirl.create(:survey)}
  let!(:second_survey) {FactoryGirl.create(:survey)}
  let!(:third_survey) {FactoryGirl.create(:survey)}

  describe "GET#index" do
    it "should return a list of all surveys" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Array)
      expect(returned_json.length).to eq 3
      expect(returned_json[0]).to be_kind_of(Hash)
    end
  end

  describe "GET#show" do
    it "should return an illness and its associated forums when given an illness id" do

      question1 = FactoryGirl.create(:question, survey: first_survey)
      choice1 = FactoryGirl.create(:choice, question: question1)
      choice2 = FactoryGirl.create(:choice, question: question1)

      get :show, params: {id: first_survey.id}

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["id"]).to eq first_survey.id
      expect(returned_json["title"]).to eq first_survey.title
      expect(returned_json["description"]).to eq first_survey.description

      expect(returned_json["questions"]).to be_kind_of(Array)
      expect(returned_json["questions"][0]["body"]).to eq question1.body
      expect(returned_json["questions"][0]["short"]).to eq question1.short

      expect(returned_json["questions"][0]["choices"]).to be_kind_of(Array)
      expect(returned_json["questions"][0]["choices"].length).to eq 2
      expect(returned_json["questions"][0]["choices"][0]).to be_kind_of(Hash)
      expect(returned_json["questions"][0]["choices"][0]["body"]).to eq choice1.body

    end
  end
end
