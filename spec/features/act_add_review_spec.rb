require 'spec_helper'

feature 'adding reviews to an act', %q{
  As an act
  I want to be able to show reviews that I have received
  So that I can impress everyone
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.create(:act) }
  let(:review) { FactoryGirl.build(:review, act: act) }

  scenario 'I can visit the add review from the act edit page' do
    go_to_edit_page
    expect(page).to have_content('Your reviews')
    click_on 'Your reviews'
    expect(current_path).to eql(act_reviews_path(2))
  end

  scenario 'I can add a review' do
    prev_count = Review.count
    go_to_review_page
    fill_in 'review_headline', with: review[:headline]
    fill_in 'review_source', with: review[:source]
    fill_in 'review_review', with: review[:review]
    click_on 'Create Review'
    expect(Review.count).to eql(prev_count + 1)
  end

  def go_to_edit_page
    sign_in_act user, act
    visit edit_act_path(act)
  end

  def go_to_review_page
    go_to_edit_page
    click_on 'Your reviews'
  end

end
