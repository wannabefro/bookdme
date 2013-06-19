require 'spec_helper'

feature 'a user can add a venue', %q{
  As a user
  I want to be able to add a venue
  So that I can book an act (for said venue)
} do

let(:user) { FactoryGirl.create(:user) }
scenario 'a user can add a venue', focus: true do
  sign_in_as user
  visit root_path
  click_on 'ADD A VENUE'
  expect(page).to have_content('Add your venue')
  expect(current_path).to eql(new_user_venue_path(user))
end

end
