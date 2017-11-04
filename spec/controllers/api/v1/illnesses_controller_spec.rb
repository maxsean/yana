require 'rails_helper'

RSpec.describe Api::V1::IllnessesController, type: :controller do

  let!(:first_illness) {FactoryGirl.create(:illness)}
  let!(:second_illness) {FactoryGirl.create(:illness)}
  let!(:third_illness) {FactoryGirl.create(:illness)}

  describe "GET#index" do
    it "should return a list of all illnesses" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["illnesses"].length).to eq 3
      expect(returned_json["illnesses"][0]).to be_kind_of(Hash)

    end
  end

  describe "GET#show" do
    it "should return an illness and its associated forums when given an illness id" do

      FactoryGirl.create(:forum, illness: first_illness)
      FactoryGirl.create(:forum, illness: first_illness)

      get :show, params: {id: first_illness.id}

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["illness"]["forums"].length).to eq 2

    end
  end
end
