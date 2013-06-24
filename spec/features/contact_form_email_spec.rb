require 'spec_helper'

feature 'contact form email', %q{
  As an administrator
  I should receive an email when someone submits a contact form
  So that I can respond to it
} do

  let!(:contact) { FactoryGirl.create(:contact) }
  let(:prev_count) { ActionMailer::Base.deliveries.count }
  background(:all) do
    @email = ContactMailer.admin_contact_form(contact)
  end

  scenario 'the email should be sent to an admin' do
    @email.should deliver_to('info@bookd.me')
  end

  scenario 'the email should have the name of the user' do
    @email.should have_body_text(contact.name)
  end

  scenario 'the email should have the reply email address' do
    @email.should have_body_text(contact.email)
  end

  scenario 'the email should have the subject' do
    @email.should have_body_text(contact.subject)
  end

  scenario 'email should have the message' do
    @email.should have_body_text(contact.message)
  end


end
