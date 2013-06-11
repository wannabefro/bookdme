require 'spec_helper'

describe 'the act show page' do
  before(:each) do
    act = FactoryGirl.create(:act)
    visit act_path(act.id)
  end

  it 'should show about us information if you click on about us' do
    click_on 'About Us'
    page.should have_content('ballerina')
    page.should_not have_content('I come from the motherland')
  end

  it 'should show the full biography if you click on biography'

  it 'should show links to youtube, soundcloud etc.. if you click on links'

  it 'should show reviews if you click on reviews'

end