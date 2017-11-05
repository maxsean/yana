require 'rails_helper'

RSpec.describe Question, type: :model do
  it {should have_valid(:body).when("this is a question?")}
  it {should_not have_valid(:body).when(nil, '')}

  it {should belong_to(:survey)}
  it {should have_many(:choices)}
  it {should_not belong_to(:user)}
end
