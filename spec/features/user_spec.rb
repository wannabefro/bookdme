require 'spec_helper'


describe 'user header' do

let!(:user) { user = FactoryGirl.create(:user) }
let!(:category) { FactoryGirl.create(:category) }
let!(:location) { FactoryGirl.create(:location) }
let!(:price) { FactoryGirl.create(:price) }
let(:act) { FactoryGirl.build(:act) }
let(:info) {
  image_path = Rails.root + 'spec/support/images/placeholder.gif'
  fill_in 'Name', with: act[:name]
  select('Dancer', :from => 'What kind of act are you')
  select('Florida', :from => 'Where are you based')
  fill_in 'What does your act specialize in', with: act[:custom_genre]
  fill_in 'Tell us about your act in 140 characters or less', with: act[:short_bio]
  select('0-50', from: 'Your hourly rate')
}

  it 'should be able to visit the edit path from the header' do

  sign_in_as user
  visit root_path
  click_on 'ADD YOUR ACT'
  info
  click_on 'Add your act'
  visit root_path
  click_on 'MY ACT'

  page.should have_content 'Edit your act'

  end
end
