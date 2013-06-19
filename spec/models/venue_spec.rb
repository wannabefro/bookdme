require 'spec_helper'

describe Venue do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:kind) }
  it { should validate_presence_of(:capacity) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:zipcode) }

  it { should ensure_inclusion_of(:kind).in_array(['House', 'Club', 'School', 'Other']) }
  it { should_not allow_value('123456').for(:zipcode) }
  it { should allow_value('02445').for(:zipcode) }
  it { should allow_value('12345-1234').for(:zipcode)}

  it { should belong_to(:user) }
  it { should belong_to(:location) }
end
