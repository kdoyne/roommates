require 'spec_helper'

describe Shopping do
   it { should belong_to(:house) }
   it { should validate_presence_of(:item) }
end
