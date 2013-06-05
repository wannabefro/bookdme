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
let(:act) { FactoryGirl.build(:act) }



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

end