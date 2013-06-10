require 'spec_helper'

describe 'Creating an act' do

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
  attach_file('Upload your image', image_path)
  fill_in 'In your own words what are you', with: act[:custom_genre]
  fill_in 'Describe your act in a couple of sentences', with: act[:short_bio]
  select('0-50', from: 'Your hourly rate')
}



  it "shouldn't allow me to sign up for a second act" do
    sign_in_as user
    visit new_act_path
    info
    click_on 'Add your act'
    show_page = current_path
    visit new_act_path

    expect(current_path).to eql(show_page)
    page.should have_content 'You can only have one act.'
  end

  it 'should visit /act/sign_up to sign up as an act' do
    sign_in_as user
    visit new_act_path
    page.should have_content 'Sign up your act'
  end

  it 'should redirect to the standard sign up if you are not logged in' do
    visit new_act_path
    expect(current_url).to include(new_user_registration_path)
  end


  it 'should show me all acts if I click browse' do
    user = FactoryGirl.create(:act)
    visit acts_path
    page.should have_content user.name
  end


  it 'should take me to my act path if I successfully sign up' do
    sign_in_as user
    visit new_act_path
    info
    click_on 'Add your act'

    page.should have_content 'MyString'
  end


  it 'should not allow me to edit an act if I am not signed in as the app owner' do
    sign_in_as user
    act = FactoryGirl.create(:act)
    sign_out_as user
    visit edit_act_path(act.id)

    page.should have_content 'You must log in to edit your act'
    expect(current_path).to eql(acts_path)
  end

  it 'should redirect me to my act page on successful log in if I have an act' do
    sign_in_as user
    visit root_path
    click_on 'Add Your Act'
    info
    click_on 'Add your act'
    act = Act.last
    click_on 'Logout'
    click_on 'SIGN IN'
    fill_in 'Email', with: user[:email]
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    expect(current_path).to eql(act_path(act.id))


  end

  it 'should allow me to see all the key information on an acts page' do
    act = FactoryGirl.create(:act)
    visit act_path(act.id)

    page.should have_content(act[:name].capitalize)
  end



end