require 'spec_helper'

feature 'editing my act', %q{
  As an act
  I want to be able to edit my act
  So that I can keep my act up to date
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.create(:act) }

  before (:each) do
    visit_edit_act
  end

  scenario 'I can add media' do
    expect(page).to have_content('Your media')
  end

  scenario 'I can go back to my profile' do
    expect(page).to have_content('Your act page')
    click_on 'Your act page'
    expect(current_path).to eql(act_path(user.act.id))
  end

  scenario 'I can edit my bio and rider' do
    expect(page).to have_content('Your bio and rider')
    click_on 'Your bio and rider'
    expect(current_path).to eql(act_biographies_path(2))
  end

  def visit_edit_act
    sign_in_act user, act
    visit edit_act_path(act)
  end

end
