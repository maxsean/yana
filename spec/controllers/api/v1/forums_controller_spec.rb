require 'rails_helper'

RSpec.describe Api::V1::ForumsController, type: :controller do
  let!(:first_illness) {FactoryGirl.create(:illness)}
  let!(:first_user) {FactoryGirl.create(:user)}

  describe "GET#show" do
    it "should return forum with its associations when given forum id" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      second_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)

      get :show, params: {id: first_forum.id}

      returned_json = JSON.parse(response.body)
      association_json = JSON.parse(returned_json["posts"])

      expect(response.status).to eq 200

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["forum"]["name"]).to eq first_forum.name
      expect(returned_json["forum"]["description"]).to eq first_forum.description

      expect(association_json).to be_kind_of(Array)
      expect(association_json.length).to eq 2
      #most recently created posts should be first in array
      expect(association_json[0]["title"]).to eq second_post.title
      expect(association_json[0]["body"]).to eq second_post.body
      expect(association_json[1]["title"]).to eq first_post.title
      expect(association_json[1]["body"]).to eq first_post.body

    end
  end
end
