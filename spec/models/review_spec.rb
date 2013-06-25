require 'spec_helper'

describe Review do
  it 'should save a valid review' do
    act = FactoryGirl.create(:act)
    review = FactoryGirl.build(:review, act: act)
    expect(review.save).to be_true
  end

  it { should belong_to(:act) }

  describe 'max reviews' do
    let(:act) { FactoryGirl.create(:act) }
    let(:review) { FactoryGirl.create_list(:review, 3, act: act) }

    it 'should allow me to have a max of 3 reviews' do
      prev_count = Review.count
      act
      review
      expect(Review.count).to eql(prev_count + 3)
    end

    it 'should not allow me to have more than 3 reviews' do
      prev_count = Review.count
      act
      review
      new_review = FactoryGirl.build(:review, act: act)
      expect(new_review).to_not be_valid
    end
  end
end
