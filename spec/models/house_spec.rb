require 'spec_helper'

describe House do
  it { should have_many(:users) }
  it { should have_many(:events) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
