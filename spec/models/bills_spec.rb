require 'spec_helper'

describe Bill do
  it { should belong_to(:user) }
  it { should belong_to(:house) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:due_date) }
end
