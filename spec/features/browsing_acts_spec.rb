require 'spec_helper'

describe 'Browsing acts' do
  before(:each) do
    FactoryGirl.create(:act)
    visit acts_path
  end

  let(:act) { FactoryGirl.attributes_for(:act) }

  it 'should contain the acts name' do
    expect(page).to have_content(act[:name])
  end

  it 'should contain the acts short bio' do
    expect(page).to have_content(act[:short_bio])
  end

  it 'should contain the acts profile pic' do
    expect(page).to have_selector('img')
  end

  it 'should be able to click on view act and see that acts profile page' do
    act = Act.last
    click_on 'View act'
    expect(page).to have_content(act[:name])
    expect(current_path).to eql(act_path(act.id))
  end
end
