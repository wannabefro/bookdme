require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Creating an act' do

let!(:user) do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
end

  it 'should take me to my act page if I click on my act' do
    visit new_act_path
    fill_in 'Name', with: 'My act'
    click_on 'Add your act'
    visit root_path
    click_on 'My Act'
    page.should have_content 'Welcome My act'
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

  it 'should be able to fill in the acts name and website' do
    prev_count = Act.count
    visit new_act_path
    fill_in 'Name', with: 'Awesome act'
    fill_in 'Your acts website', with: 'mywebsite.com'
    click_on 'Add your act'
    page.should have_content 'Welcome Awesome act'
    expect(Act.count).to_not eql(prev_count)
  end


  it 'should show me all acts if I click browse' do
    user = FactoryGirl.create(:act)
    visit acts_path
    page.should have_content user.name
  end

  it 'should allow me to upload an image' do
    user = FactoryGirl.attributes_for(:act)
    image_path = Rails.root + 'spec/support/images/placeholder.gif'

    visit new_act_path
    fill_in 'Name', with: user[:name]
    attach_file('Upload your image', image_path)
    click_on 'Add your act'

    page.should have_content 'Welcome MyString'
    act = Act.last
    expect(act.avatar.url).to include user[:avatar].original_filename
  end

  it 'should be able to select a category for the act' do
    user = FactoryGirl.attributes_for(:act)
    FactoryGirl.create(:category)

    visit new_act_path
    fill_in 'Name', with: user[:name]
    page.select('Dancer', from: 'What kind of act are you')
    click_on 'Add your act'

    page.should have_content 'Welcome MyString'
    act = Act.last
    expect(act.category.name).to eql('Dancer')

  end

  it 'should be able to select a location for the act' do
    user = FactoryGirl.attributes_for(:act)
    location = FactoryGirl.create(:location)

    visit new_act_path
    fill_in 'Name', with: user[:name]
    page.select('Florida', from: 'Where are you based')
    click_on 'Add your act'

    page.should have_content 'Welcome MyString'
    act = Act.last
    expect(act.location.state).to eql location.state
  end

  it 'should be able to add a custom genre' do
    user = FactoryGirl.attributes_for(:act)

    visit new_act_path
    fill_in 'Name', with: user[:name]
    fill_in 'In your own words what are you', with: user[:custom_genre]
    click_on 'Add your act'

    page.should have_content 'Welcome MyString'
    act = Act.last
    expect(act.custom_genre).to eql user[:custom_genre]
  end
end