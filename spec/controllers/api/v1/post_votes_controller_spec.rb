require 'rails_helper'

RSpec.describe Api::V1::PostVotesController, type: :controller do
  let!(:first_user) {FactoryGirl.create(:user)}
  let!(:first_illness) {FactoryGirl.create(:illness)}

  describe "POST#create" do
    it "should return current state of post karma" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      first_post_vote = PostVote.create(user: first_user, post: first_post, value: 1)

      post_json = {user_id: first_user.id, post_id: first_post.id, value: nil}.to_json

      post :create, body: post_json
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(returned_json["karma"]).to eq 1
    end
  end

  describe "PATCH#update" do
    it "should update karma when upvote is clicked" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      first_post_vote = PostVote.create(user: first_user, post: first_post, value: 0)

      post_json = {user_id: first_user.id, post_id: first_post.id, value: 1}.to_json

      patch :update, {params: {id: first_post.id}, body: post_json}

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(returned_json["karma"]).to eq 1
      expect(returned_json["upvote"]).to eq 1
      expect(returned_json["downvote"]).to eq 0
    end

    it "should update karma when downvote is clicked" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      first_post_vote = PostVote.create(user: first_user, post: first_post, value: 0)

      post_json = {user_id: first_user.id, post_id: first_post.id, value: -1}.to_json

      patch :update, {params: {id: first_post.id}, body: post_json}

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(returned_json["karma"]).to eq -1
      expect(returned_json["upvote"]).to eq 0
      expect(returned_json["downvote"]).to eq 1
    end

    it "should update karma when clearvote is clicked" do
      first_forum = FactoryGirl.create(:forum, illness: first_illness)
      first_post = FactoryGirl.create(:post, forum: first_forum, user: first_user)
      first_post_vote = PostVote.create(user: first_user, post: first_post, value: 1)

      post_json = {user_id: first_user.id, post_id: first_post.id, value: 0}.to_json

      patch :update, {params: {id: first_post.id}, body: post_json}

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(returned_json["karma"]).to eq 0
      expect(returned_json["upvote"]).to eq 0
      expect(returned_json["downvote"]).to eq 0
    end

  end
end
