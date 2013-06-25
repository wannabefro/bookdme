require 'spec_helper'

feature 'searching for acts', %q{
  As a user
  I want to be able to search for acts
  So that I may book awesome acts
} do

  let(:act1) { FactoryGirl.create(:act) }
  let(:act2) { FactoryGirl.create(:act2, location: cali, category: music) }
  let(:act3) { FactoryGirl.create(:act3, location: home, category: magic) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:cali) { FactoryGirl.create(:cali) }
  let!(:home) { FactoryGirl.create(:home) }
  let!(:music) { FactoryGirl.create(:music) }
  let!(:magic) { FactoryGirl.create(:magic) }

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

  scenario 'I should be able to search for an act by custom-genre' do
    visit acts_path
    fill_in 'query', with: act1.custom_genre
    click_on 'Search'

    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.custom_genre)
    expect(page).to_not have_content(act3.custom_genre)
  end

  scenario 'I should be able to search for an act by location' do
    visit acts_path
    fill_in 'query', with: act1.location.state
    click_on 'Search'


    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.name)
    expect(page).to_not have_content(act3.name)
  end

  scenario 'I should be able to search for an act by cateogry' do
    visit acts_path
    fill_in 'query', with: act1.category.name
    click_on 'Search'

    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.name)
    expect(page).to_not have_content(act3.name)
  end

  scenario 'I should be able to search with a misspelling' do
    visit acts_path
    fill_in 'query', with: 'Bellinda the grat'
    click_on 'Search'

    expect(page).to have_content(act1.name)
    expect(page).to_not have_content(act2.name)
    expect(page).to_not have_content(act3.name)
  end

end
