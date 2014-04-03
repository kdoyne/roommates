require 'spec_helper'

describe Event do
  it { should belong_to(:house) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date_time) }
end
