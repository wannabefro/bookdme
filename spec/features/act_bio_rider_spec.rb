require 'spec_helper'

feature 'adding a bio', %q{
  As an act
  I want to be able to add my biography
  So that users may learn more about me
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.create(:act) }
  let(:bio) { FactoryGirl.build(:biography, act: act)}

  scenario 'there is a bio text area' do
    go_to_bio_page
    expect(page).to have_content('Your biography')
  end

  scenario 'if I fill out my bio successfully it saves' do
    prev_count = Biography.count
    go_to_bio_page
    fill_in 'biography_biography', with: bio[:biography]
    click_on 'Create Biography'
    expect(Biography.count).to eql(prev_count + 1)
  end

  scenario 'there is a rider text area', focus: true do
    go_to_bio_page
    expect(page).to have_content('Your rider')
  end

  def go_to_bio_page
    sign_in_act user, act
    visit edit_act_path(act)
    click_on 'Your bio and rider'
  end

end
