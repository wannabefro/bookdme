require 'spec_helper'

describe Proposal do
 it { should validate_presence_of(:user) }
 it { should validate_presence_of(:act) }
 it { should validate_presence_of(:price) }
 it { should validate_presence_of(:date) }
 it { should validate_presence_of(:time) }
 it { should validate_presence_of(:proposal) }

 it { should belong_to(:user) }
 it { should belong_to(:act) }
end
