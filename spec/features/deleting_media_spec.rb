require 'spec_helper'

feature 'deleting media', %q{
  As an act
  I want to be able to delete media
  So that I can replace it with better media
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:act) { FactoryGirl.create(:act, user: user) }
  let(:media) { FactoryGirl.create(:media_post, act: act) }


  scenario 'should on succesful delete no longer appear on my media page' do
    media
    prev_count = MediaPost.count
    add_media
    find(:css, "#media_post_ids_[value='1']").set(true)
    click_on 'Delete selected'
    expect(MediaPost.count).to eql(prev_count - 1)
  end

  scenario 'I should be able to delete multiple files at the same time' do
    media
    FactoryGirl.create(:media_post, act: act)
    prev_count = MediaPost.count
    add_media
    find(:css, "#media_post_ids_[value='1']").set(true)
    find(:css, "#media_post_ids_[value='2']").set(true)
    click_on 'Delete selected'
    expect(MediaPost.count).to eql(prev_count - 2)
  end

  scenario 'if a user has no media the delete button should be disabled' do
    add_media
    expect(page).to have_no_selector ".delete_button[disabled]"
  end

  def add_media
    sign_in_as user
    visit act_media_posts_path(act)
  end
end
