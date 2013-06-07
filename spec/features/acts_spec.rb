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
}



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

  # it 'should allow me to upload an image' do
  #   user = FactoryGirl.attributes_for(:act)
  #   image_path = Rails.root + 'spec/support/images/placeholder.gif'

  #   visit new_act_path
  #   fill_in 'Name', with: user[:name]

  #   attach_file('Upload your image', image_path)
  #   click_on 'Add your act'

  #   page.should have_content 'Welcome MyString'
  #   act = Act.last
  #   expect(act.avatar.url).to include user[:avatar].original_filename
  # end

  it 'should allow me to add a short bio' do
    visit new_act_path

    info
    fill_in 'Describe your act in a couple of sentences', with: act[:short_bio]
    click_on 'Add your act'

    act = Act.last
    expect(act.short_bio).to eql(act[:short_bio])
  end

  it 'should allow me to add an hourly rate' do
    visit new_act_path

    info
    select('0-50', from: 'Your hourly rate')
    click_on 'Add your act'

    act = Act.last
    expect(act.price.range).to eql('0-50')
  end


end