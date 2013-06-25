require 'spec_helper'

feature 'adding reviews to an act', %q{
  As an act
  I want to be able to show reviews that I have received
  So that I can impress everyone
}, focus: true do

  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.create(:act) }

  scenario 'I can visit the add review from the act edit page' do
    go_to_edit_page
    expect(page).to have_content('Your reviews')
    click_on 'Your reviews'
    expect(current_path).to eql(act_reviews_path(2))
  end

  def go_to_edit_page
    sign_in_act user, act
    visit edit_act_path(act)
  end

end
