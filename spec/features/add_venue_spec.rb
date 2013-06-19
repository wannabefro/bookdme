require 'spec_helper'

feature 'a user can add a venue', %q{
  As a user
  I want to be able to add a venue
  So that I can book an act (for said venue)
} do

let(:venue) { FactoryGirl.build(:venue) }
let!(:location) { FactoryGirl.create(:location) }
let(:user) { FactoryGirl.create(:user) }

  scenario 'a user can add a venue' do
    sign_in_as user
    visit root_path
    click_on 'ADD A VENUE'
    expect(page).to have_content('Add your venue')
    expect(current_path).to eql(new_venue_path)
  end

  scenario "if a user isn't signed in the can't add a venue" do
    visit new_venue_path
    expect(page).to have_content('You need to sign in first')
    expect(current_path).to eql(new_user_session_path)
  end

  scenario 'a user can succsessfully add a venue' do
    prev_count = Venue.count

    sign_in_as user
    visit new_venue_path
    fill_in 'Name', with: venue[:name]
    select('House', from: 'What kind of venue is it?')
    fill_in 'Capacity', with: venue[:capacity]
    fill_in 'City', with: venue[:city]
    select('Florida', from: 'State' )
    fill_in 'Zip Code', with: venue[:zipcode]

    click_on 'Add venue'
    expect(Venue.count).to eql(prev_count + 1)
    expect(page).to have_content('Successfully added a venue')
  end


end
