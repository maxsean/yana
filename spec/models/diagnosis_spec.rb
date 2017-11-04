require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  it {should belong_to(:user)}

  it {should belong_to(:illness)}
end
