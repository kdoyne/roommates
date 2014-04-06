require 'spec_helper'

describe Event do
  it { should belong_to(:user) }
  it { should have_many(:reminders) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
end
