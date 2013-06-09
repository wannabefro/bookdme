require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Creating an act' do

let!(:user) do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
end
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



  it "shouldn't allow me to sign up for a second act" do
    visit new_act_path
    info
    click_on 'Add your act'
    show_page = current_path
    visit new_act_path

    expect(current_path).to eql(show_page)
    page.should have_content 'You can only have one act.'
  end

  it 'should visit /act/sign_up to sign up as an act' do
    visit new_act_path
    page.should have_content 'Sign up your act'
  end

  it 'should redirect to the standard sign up if you are not logged in' do
    logout(:user)
    visit new_act_path
    expect(current_url).to include(new_user_registration_path)
  end


  it 'should show me all acts if I click browse' do
    user = FactoryGirl.create(:act)
    visit acts_path
    page.should have_content user.name
  end


  it 'should take me to my act path if I successfully sign up' do
    visit new_act_path
    info
    click_on 'Add your act'

    page.should have_content 'MyString'
  end


  it 'should not allow me to edit an act if I am not signed in as the app owner' do
    act = FactoryGirl.create(:act)
    logout(:user)
    visit edit_act_path(act.id)

    page.should have_content 'You must log in to edit your act'
    expect(current_path).to eql(acts_path)
  end


end