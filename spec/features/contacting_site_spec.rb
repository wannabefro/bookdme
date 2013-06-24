require 'spec_helper'

feature 'contacting admins', %q{
  As a user/act
  I want to be able to contact the site owners
  So that I can give feedback or receive help
} do


  scenario 'I can visit a page to fill in a contact form' do
    visit new_contact_path
    expect(page).to have_content('Get in Touch!')
  end

  scenario 'I can fill out the form and submit it to the admin' do
    prev_count = Contact.count
    visit new_contact_path
    contact_form
    click_on 'Submit'
    expect(Contact.count).to eql(prev_count + 1)
  end

  scenario "a notice should tell me that I've successfully sent a contact" do
    visit new_contact_path
    contact_form
    click_on 'Submit'
    expect(page).to have_content("Thanks for getting in touch. We'll respond as soon as we can.")
  end

  scenario 'I receive an email stating that I submitted a request as does the admin' do
    prev_count = ActionMailer::Base.deliveries.count
    visit new_contact_path
    contact_form
    click_on 'Submit'
    expect(ActionMailer::Base.deliveries.count).to eql(prev_count + 2)
  end

  def contact_form
    contact = FactoryGirl.build(:contact)
    fill_in 'contact_name', with: contact[:name]
    fill_in 'contact_email', with: contact[:email]
    fill_in 'contact_subject', with: contact[:subject]
    fill_in 'contact_message', with: contact[:message]
  end

end
