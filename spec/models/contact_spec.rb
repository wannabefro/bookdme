require 'spec_helper'

describe Contact do

  it{ should belong_to(:user) }
  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:email) }
  it{ should validate_presence_of(:message) }
  it{ should validate_presence_of(:subject) }

  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@b.com").for(:email) }

end
