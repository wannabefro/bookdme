require 'spec_helper'

feature 'searching for acts', %q{
  As a user
  I want to be able to search for acts
  So that I may book awesome acts
} do

  let(:act1) { FactoryGirl.create(:act) }
  let(:act2) { FactoryGirl.create(:act2) }
  let(:act3) { FactoryGirl.create(:act3) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:location) { FactoryGirl.create(:location) }

  before (:each) do
    act1
    act2
    act3
  end

  scenario 'I should be able to search for an act by name from the home page' do
    visit root_path
    fill_in 'query', with: act1.name
    click_on 'Search'

    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.name)
    expect(page).to_not have_content(act3.name)
  end

  scenario 'I should be able to search for an act by name from the browse act page' do
    visit acts_path
    fill_in 'query', with: act1.name
    click_on 'Search'

    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.name)
    expect(page).to_not have_content(act3.name)
  end

end
