require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Creating an act' do

let!(:user) do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
end

  it 'should visit /act/sign_up to sign up as an act' do
    visit new_act_path
    page.should have_content 'Sign up your act'
  end

  it 'should redirect to the standard sign up if you are not logged in' do
    logout(:user)
    visit new_act_path
    expect(current_url).to include(new_user_registration_path)
  end

  it 'should be able to fill in the acts name' do
    prev_count = Act.count
    visit new_act_path
    fill_in 'Name', with: 'Awesome act'
    click_on 'Add your act'
    page.should have_content 'Welcome Awesome act'
    expect(Act.count).to_not eql(prev_count)
  end
end