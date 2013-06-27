require 'spec_helper'

describe 'the act show page' do
  before(:each) do
    user = FactoryGirl.create(:user)
    act = FactoryGirl.create(:act, user: user)
    sign_in_as user
    visit act_path(act.id)
  end

  it 'should have an edit your act button' do
    expect(page).to have_content('edit your act')
  end

  it 'should have a proposals button' do
    expect(page).to have_content('your proposals')
  end



end
