require 'spec_helper'

describe Seeders::Prices do

  let(:seeder) { Seeders::Prices}

  it 'seeds Prices' do
    price_count = Price.count
    seeder.seed
    expect(Price.count).to_not eq(price_count)
  end

  it 'can be run multiple times without duplication' do
    seeder.seed
    price_count = Price.count
    seeder.seed
    expect(Price.count).to eq(price_count)
  end
end
