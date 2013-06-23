require 'spec_helper'

feature 'deleting media', %q{
  As an act
  I want to be able to delete media
  So that I can replace it with better media
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.create(:act, user: user) }
  let!(:media) { FactoryGirl.create(:media_post, act: act) }

  scenario 'there should be a delete button below media' do
    add_media
    expect(page).to have_content('Delete selected')
  end

  scenario "it should ask if you're sure you want to delete", focus: true do

  end

  scenario 'should on succesful delete no longer appear on my media page'

  def add_media
    sign_in_as user
    visit act_media_posts_path(act)
  end
end
