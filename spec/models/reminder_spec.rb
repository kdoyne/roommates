require 'spec_helper'

describe Reminder do
  it { should belong_to(:event) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:message) }
end
