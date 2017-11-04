require 'rails_helper'

RSpec.describe Forum, type: :model do

  it {should have_valid(:name).when("CF Community")}

  it {should_not have_valid(:name).when(nil, '')}

  it {should have_many(:posts)}

  it {should belong_to(:illness)}

  it {should_not belong_to(:user)}

end
