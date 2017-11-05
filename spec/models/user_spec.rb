require 'rails_helper'

RSpec.describe User, type: :model do

  it {should have_valid(:handle).when("thisisusername")}
  it {should_not have_valid(:handle).when(nil, "")}

  it {should have_valid(:email).when("buster@bluth.com")}
  it {should_not have_valid(:email).when(nil, "")}

  it "has a matching password confirmation for the password" do
    user = User.new
    user.password = "password"
    user.password_confirmation = "anotherpassword"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  it {should have_many(:post_votes)}
  it {should have_many(:posts)}
  it {should have_many(:comments)}
  it {should have_many(:submissions)}
  it {should have_many(:choices).through(:submissions)}
  it {should have_many(:diagnoses)}
  it {should have_many(:illnesses).through(:diagnoses)}
end
