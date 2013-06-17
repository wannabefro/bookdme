require 'spec_helper'

feature 'receive welcome email on act sign up', %q{
  As an act
  I should receive a welcome email on sign-up
  So that I know that I have signed up and receive basic information
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.build(:act) }
  let(:prev_count) { ActionMailer::Base.deliveries.count }
  background(:all) do
    @email = UserMailer.act_signup_confirmation(user, act)
  end

  scenario 'an act should receive a welcome email on sign up' do
    prev_count
    FactoryGirl.create(:act)
    expect(ActionMailer::Base.deliveries.count).to eql(prev_count + 1)
  end

  scenario 'the email should be sent to the acts email address' do
    @email.should deliver_to(user.email)
  end

  scenario 'the email should have the correct subject' do
    @email.should have_subject('Act Sign Up Confirmation')
  end

  scenario 'the email should have the first name in the body' do
    @email.should have_body_text(user.first_name)
  end

  scenario 'the email should have the acts name in the body' do
    @email.should have_body_text(act.name)
  end
end
