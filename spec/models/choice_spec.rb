require 'rails_helper'

RSpec.describe Choice, type: :model do
  it {should have_valid(:body).when("this is a choice")}
  it {should_not have_valid(:body).when(nil, '')}

  it {should belong_to(:question)}
  it {should have_many(:submissions)}
  it {should have_many(:users).through(:submissions)}
end
