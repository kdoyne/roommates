require 'spec_helper'

describe Reminder do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:remind_at) }
  it { should validate_presence_of(:message) }
end
