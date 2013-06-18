require 'spec_helper'

feature 'booking an act', %q{
As a user
I want to be able to get in contact with an act with a basic proposal
So that I may successfully hire them
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.create(:act) }
  let!(:proposal) { FactoryGirl.create(:proposal) }
  let(:setup) do
    sign_in_as user
    visit act_path(act)
    click_on 'book me'
  end

  scenario 'a user can click on book me and see a contact form' do
    sign_in_as user
    visit act_path(act)
    click_on 'book me'

    expect(page).to have_content("Submit your proposal to #{act.name}")
  end

  scenario 'if a user is not logged in and click on book me they are redirected to the sign in path' do
    visit act_path(act)
    click_on 'book me'

    expect(page).to have_content('You need to sign in first')
    expect(current_path).to eql(new_user_session_path)
  end

  scenario 'a user should be able to fill in a form with the proposals information' do
    setup

    fill_in 'Price', with: proposal[:price]
    fill_in 'Date', with: proposal[:date]
    fill_in 'Proposal', with: proposal[:proposal]

    expect(page).to have_content(proposal[:proposal])
  end

  scenario 'if a user fills out a complete proposal they should be able to submit the proposal' do
    setup
    prev_count = Proposal.count

    fill_in 'Price', with: proposal[:price]
    fill_in 'Date', with: proposal[:date]
    fill_in 'Proposal', with: proposal[:proposal]
    fill_in 'Time', with: proposal[:time]
    click_on 'Submit proposal'

    expect(current_path).to eq(act_path(act))
    expect(page).to have_content('Thank you for submitting your proposal.')
    expect(Proposal.count).to eql(prev_count + 1)
  end

  scenario "if a user doesn't accurately fillout the form it shouldn't submit" do
    setup
    prev_count = Proposal.count
    current_page = current_path

    fill_in 'Price', with: proposal[:price]

    expect(current_path).to eq(current_path)
    expect(Proposal.count).to eq(prev_count)
  end

  scenario 'a user should receive an email confirming that they have attempted to book a band' do
    setup
    prev_count = ActionMailer::Base.deliveries.count

    fill_in 'Price', with: proposal[:price]
    fill_in 'Date', with: proposal[:date]
    fill_in 'Proposal', with: proposal[:proposal]
    fill_in 'Time', with: proposal[:time]
    click_on 'Submit proposal'

    expect(ActionMailer::Base.deliveries.count).to eq(prev_count + 2)
  end

  scenario 'the act who has the submitted proposal should receive an email with the proposal' do
    setup
    prev_count = ActionMailer::Base.deliveries.count

    fill_in 'Price', with: proposal[:price]
    fill_in 'Date', with: proposal[:date]
    fill_in 'Proposal', with: proposal[:proposal]
    fill_in 'Time', with: proposal[:time]
    click_on 'Submit proposal'

    expect(ActionMailer::Base.deliveries.count).to eq(prev_count + 2)
  end


end
