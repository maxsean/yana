require 'rails_helper'

RSpec.describe Post, type: :model do

  it {should have_valid(:title).when("I'm a post")}

  it {should_not have_valid(:title).when(nil, '')}

  it {should have_many(:comments)}

  it {should belong_to(:forum)}

  it {should belong_to(:user)}

end
