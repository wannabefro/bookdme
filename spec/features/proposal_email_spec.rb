require 'spec_helper'

feature 'receive email on submition on proposal', %q{
  As an act
  I should receive an email confirming that a proposal has been made
  So that I may make contact with the user who wants to book me
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.build(:act) }
  let!(:proposal) { FactoryGirl.build(:proposal) }
  let(:prev_count) { ActionMailer::Base.deliveries.count }
  background(:all) do
    @email = UserMailer.act_proposal(user, act, proposal)
  end

  scenario 'the email should be sent to the acts email address' do
    @email.should deliver_to(act.user.email)
  end

  scenario 'the email should have the correct subject' do
    @email.should have_subject("#{user.first_name} wants to book you")
  end

  scenario 'the email should have the name of the user in the body' do
    @email.should have_body_text(user.first_name)
    @email.should have_body_text(user.last_name)
  end

  scenario 'the email should have the users email address' do
    @email.should have_body_text(user.email)
  end

  scenario 'the email should have the users proposal' do
    @email.should have_body_text(proposal.price.to_s)
    @email.should have_body_text(proposal.proposal)
    @email.should have_body_text(proposal.date.strftime('%A, %b %d'))
  end
end
