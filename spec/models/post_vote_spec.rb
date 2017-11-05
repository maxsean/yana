require 'rails_helper'

RSpec.describe PostVote, type: :model do
  it {should belong_to(:post)}

  it {should belong_to(:user)}

  it {should have_valid(:value).when(1, 0, -1)}
  it {should_not have_valid(:value).when(nil, '', 2, -2, 'a')}
end
