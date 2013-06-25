require 'spec_helper'

feature 'user contact form email', %q{
  As a user
  I should receive an email when I submit a contact form
  So that I know I successfully submitted one
} do

  let!(:contact) { FactoryGirl.create(:contact) }
  let(:prev_count) { ActionMailer::Base.deliveries.count }
  background(:all) do
    @email = ContactMailer.contact_form(contact)
  end

  scenario 'I should receive an email saying that I successfully sent a contact form' do
    @email.should have_body_text('Thanks for getting in touch')
  end


end
