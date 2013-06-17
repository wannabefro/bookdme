require 'spec_helper'

feature 'booking an act', %q{
As a user
I want to be able to get in contact with an act with a basic proposal
So that I may successfully hire them
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.create(:act) }

  scenario 'a user can click on book me and see a contact form' do
    sign_in_as user
    visit act_path(act)
    click_on 'book me'

    expect(page).to have_content("Submit your proposal to #{act.name}")
  end
end
