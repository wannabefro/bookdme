require 'spec_helper'

describe Media do
  it { should validate_presence_of(:act) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:media_type) }

  it { should ensure_inclusion_of(:media_type).in_array(['youtube', 'soundcloud']) }

  it { should belong_to(:act) }
end
