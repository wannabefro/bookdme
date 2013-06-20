require 'spec_helper'


feature 'act adding media to show page', %q{
  As an act
  I want to be able to add media to my show page
  So that users may preview my act better
} do

# I can add in images (soundcloud), video (youtube), and more pictures to my act

  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.create(:act) }


  scenario 'I can add a youtube video to my media' do
    go_to_media_page
    click_on 'Add video'
    within "#myVideo" do
      fill_in 'Youtube Url', with: 'http://www.youtube.com/watch?v=J11uu8L8FTY'
      click_on 'Submit video'
    end
    expect(page).to have_content('Successfully added video')
  end

  scenario 'I can add a soundcloud link to my media' do
    go_to_media_page
    click_on 'Add audio'
    within "#myAudio" do
      fill_in 'Soundcloud Url', with: 'https://soundcloud.com/aviciiofficial/avicii-promotional-mix-2013'
      click_on 'Submit audio'
    end
    expect(page).to have_content('Successfully added audio')
  end

  def go_to_media_page
    sign_in_act user, act
    visit edit_act_path(act)
    click_on 'Add media'
  end
end
