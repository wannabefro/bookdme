require 'spec_helper'

describe Seeders::Categories do

  let(:seeder) { Seeders::Categories}

  it 'seeds categories' do
    category_count = Category.count
    seeder.seed
    expect(Category.count).to_not eq(category_count)
  end

  it 'can be run multiple times without duplication' do
    seeder.seed
    category_count = Category.count
    seeder.seed
    expect(Category.count).to eq(category_count)
  end
end
