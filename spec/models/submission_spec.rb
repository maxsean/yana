require 'rails_helper'

RSpec.describe Submission, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:choice)}
end
