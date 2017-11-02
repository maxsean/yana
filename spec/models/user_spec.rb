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
end
