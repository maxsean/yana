require 'rails_helper'

RSpec.describe Survey, type: :model do
  it {should have_valid(:title).when("some survey")}
  it {should_not have_valid(:title).when(nil, '')}

  it {should have_many(:questions)}

  it {should_not belong_to(:user)}
  it {should_not belong_to(:illness)}
  it {should_not belong_to(:forum)}
end
