require 'spec_helper'

describe Seeders::States do

  let(:seeder) { Seeders::States}

  it 'seeds states' do
    state_count = Location.count
    seeder.seed
    expect(Location.count).to_not eq(state_count)
  end

  it 'can be run multiple times without duplication' do
    seeder.seed
    state_count = Location.count
    seeder.seed
    expect(Location.count).to eq(state_count)
  end
end
