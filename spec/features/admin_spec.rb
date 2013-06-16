require 'spec_helper'

feature "Admin page (with rails admin)", %q{
  As an admin
  I want to be able to visit and admin page
  So that I may administrate my site
} do

let(:admin) { FactoryGirl.create(:admin) }
let(:user) { FactoryGirl.create(:user) }

  scenario 'If I have admin credentials I can visit the admin page' do
    admin
    sign_in_as admin
    visit rails_admin_path

    expect(current_path).to eql(rails_admin_path)
  end

  scenario 'If I am not an admin I cannot visit the admin page' do
    user
    sign_in_as user
    visit rails_admin_path

    expect(current_path).to_not eql(rails_admin_path)
  end

end
