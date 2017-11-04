require 'rails_helper'

RSpec.describe Illness, type: :model do
  it {should have_valid(:name).when('Cystic Fibrosis')}
  it {should_not have_valid(:name).when(nil, '')}

  it {should have_many(:forums)}

  it {should have_many(:diagnoses)}

  it {should have_many(:users).through(:diagnoses)}

  it {should_not belong_to(:forum)}

  it {should_not belong_to(:user)}
end
