require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let!(:first_illness) {FactoryGirl.create(:illness)}
  let!(:first_user) {FactoryGirl.create(:user)}

  describe "POST#create" do
    it "should create a new comment and return list of comments and success message" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)

      post_json = { body: "testBody", post_id: first_post.id, user_id: first_user.id }.to_json

      expect{ post :create, body: post_json }.to change{ Comment.count }.by(1)

      returned_json = JSON.parse(response.body)
      comments_json = JSON.parse(returned_json["comments"])

      expect(returned_json["messages"]).to be_kind_of(Hash)
      expect(returned_json["messages"]["comment"]).to eq ["posted!"]

      expect(comments_json).to be_kind_of(Array)
      expect(comments_json[0]["body"]).to eq "testBody"
      expect(comments_json[0]["user_id"]).to eq first_user.id
      expect(comments_json[0]["post_id"]).to eq first_post.id
      expect(comments_json[0]["user"]).to be_kind_of(Hash)
      expect(comments_json[0]["user"]["id"]).to eq first_user.id

    end

    it "should not create a new post when attributes violate validations and return error messages" do

      post_json = { body: "testBody"}.to_json

      expect{ post :create, body: post_json }.to change{ Post.count }.by(0)

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["error"].length).to eq 2
    end
  end
end
