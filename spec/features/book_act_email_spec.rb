require 'spec_helper'

feature 'receive confirmation on succesful proposal', %q{
  As a user
  I should receive a confirmation email on submitting a proposal
  So that I know that I have successfully submitted my proposal
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.build(:act) }
  let(:prev_count) { ActionMailer::Base.deliveries.count }
  background(:all) do
    @email = UserMailer.act_book_confirmation(user, act)
  end

  scenario 'the email should be sent to the users email address' do
    @email.should deliver_to(user.email)
  end

  scenario 'the email should have the correct subject' do
    @email.should have_subject("You just bookd #{act.name}")
  end

  scenario 'the email should have the first name in the body' do
    @email.should have_body_text(user.first_name)
  end

  scenario 'the email should have the acts name in the body' do
    @email.should have_body_text(act.name)
  end
end
