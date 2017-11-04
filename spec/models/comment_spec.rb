require 'rails_helper'

RSpec.describe Comment, type: :model do

  it {should have_valid(:body).when('this is a comment on a post')}

  it {should_not have_valid(:body).when(nil, '')}

  it {should belong_to(:user)}

  it {should belong_to(:post)}

end
