require 'spec_helper'

feature 'viewing proposals', %q{
  As an act
  I want to be able to see all of my proposals
  So that I can see who wants to book me
}, focus: true do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @act = FactoryGirl.create(:act, user: @user)
      sign_in_as @user
      visit act_path(@act.id)
    end

    let(:user2) { FactoryGirl.create(:user) }
    let(:proposal) { FactoryGirl.create(:proposal, act: @act, user: user2) }
    let(:proposals) { FactoryGirl.create_list(:proposal, 2, act: @act, user: user2) }

    it 'should show proposals' do
      user2
      proposal
      click_on 'your proposals'
      expect(page).to have_content(proposal[:proposal])
    end

    it 'should show the date and time of the proposal and the price' do
      user2
      proposal
      click_on 'your proposals'
      expect(page).to have_content(proposal[:date].strftime('%A, %b %d'))
      expect(page).to have_content(proposal[:price])
    end

    it 'should allow me to delete a proposal' do
      user2
      proposal
      prev_count = Proposal.count
      click_on 'your proposals'
      click_on 'Delete'
      expect(Proposal.count).to eql(prev_count - 1)
    end

    it 'should allow me to go back to my page' do
      user2
      proposal
      click_on 'your proposals'
      click_on 'Back to act'
      expect(current_path).to eql(act_path(@act))
    end
end
