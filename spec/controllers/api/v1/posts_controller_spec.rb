require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let!(:first_illness) {FactoryGirl.create(:illness)}
  let!(:first_user) {FactoryGirl.create(:user)}

  describe "GET#show" do
    it "should return post with its associations when given post id" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      first_comment = FactoryGirl.create(:comment, post: first_post, user: first_user)
      second_comment = FactoryGirl.create(:comment, post: first_post, user: first_user)

      get :show, params: {id: first_post.id}

      returned_json = JSON.parse(response.body)
      post_json = JSON.parse(returned_json["post"])
      association_json = JSON.parse(returned_json["comments"])

      expect(response.status).to eq 200

      expect(returned_json).to be_kind_of(Hash)
      expect(post_json["title"]).to eq "post4"
      expect(post_json["body"]).to eq "post body 4"

      expect(association_json).to be_kind_of(Array)
      expect(association_json.length).to eq 2
      #most recently created comments should be first in array
      expect(association_json[0]["body"]).to eq "comment2"
      expect(association_json[1]["body"]).to eq "comment1"

    end
  end

  describe "POST#create" do
    it "should create a new post and return list of posts and success message" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)

      post_json = { title: "testTitle", body: "testBody", forum_id: first_forum.id, user_id: first_user.id }.to_json

      expect{ post :create, body: post_json }.to change{ Post.count }.by(1)

      returned_json = JSON.parse(response.body)
      posts_json = JSON.parse(returned_json["posts"])

      expect(returned_json["messages"]).to be_kind_of(Hash)
      expect(returned_json["messages"]["post"]).to eq ["successful!"]

      expect(posts_json).to be_kind_of(Array)
      expect(posts_json[0]["title"]).to eq "testTitle"
      expect(posts_json[0]["body"]).to eq "testBody"
      expect(posts_json[0]["user_id"]).to eq first_user.id
      expect(posts_json[0]["forum_id"]).to eq first_forum.id
      expect(posts_json[0]["user"]).to be_kind_of(Hash)
      expect(posts_json[0]["user"]["id"]).to eq first_user.id

    end

    it "should not create a new post when attributes violate validations and return error messages" do

      post_json = { title: "testTitle", body: "testBody"}.to_json

      expect{ post :create, body: post_json }.to change{ Post.count }.by(0)

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["error"].length).to eq 2
    end
  end
end