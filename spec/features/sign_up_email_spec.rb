require 'spec_helper'

feature 'receive an email on sign up', %q{
  As a user
  I should receive an email confirming I've signed up
  So that I know that I know I signed up
} do

  let(:user) { FactoryGirl.build(:user) }

  scenario 'a user receives an email on successful sign up' do
    prev_count = ActionMailer::Base.deliveries.count
    user
    visit new_user_registration_path
    Stuffer.factorize :user
    Stuffer.stuff
    click_on 'Sign up'

    expect(ActionMailer::Base.deliveries.count).to eql(prev_count + 1)
    expect(page).to have_content("Welcome! You have signed up successfully. You'll receive a confirmation email shortly.")
  end
end
