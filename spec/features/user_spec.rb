require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!



describe 'user header' do

let!(:category) { FactoryGirl.create(:category) }
let!(:location) { FactoryGirl.create(:location) }
let!(:price) { FactoryGirl.create(:price) }
let(:act) { FactoryGirl.build(:act) }
let(:info) {
  image_path = Rails.root + 'spec/support/images/placeholder.gif'
  fill_in 'Name', with: act[:name]
  select('Dancer', :from => 'What kind of act are you')
  select('Florida', :from => 'Where are you based')
  attach_file('Upload your image', image_path)
  fill_in 'In your own words what are you', with: act[:custom_genre]
  fill_in 'Describe your act in a couple of sentences', with: act[:short_bio]
  select('0-50', from: 'Your hourly rate')
}

  it 'should be able to visit the edit path from the header' do
  user = FactoryGirl.create(:user)

  login_as(user, :scope => :user)
  visit root_path
  click_on 'Add Your Act'
  info
  click_on 'Add your act'
  visit root_path
  click_on 'My Act'

  page.should have_content 'Edit your act'

  end
end