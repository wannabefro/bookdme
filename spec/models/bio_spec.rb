require 'spec_helper'

describe Biography do

    describe 'validations' do
    let(:act) { FactoryGirl.create(:act) }
    let(:bio) { FactoryGirl.build(:biography, act: act)}

      it 'should save if act and biography are present' do
        expect(bio.save).to be_true
      end
    end

  it{ should belong_to(:act) }

  describe 'an act can only have 1 biography' do
    let!(:act) { FactoryGirl.create(:act) }
    let!(:bio) { FactoryGirl.create(:biography, act: act)}

    it 'should let me save one biography' do
      expect(Biography.count).to eql(1)
    end

    it 'should not let me save a second biography' do
      second = FactoryGirl.build(:biography, act: act)
      expect(second).to_not be_valid
    end

    it 'should let me update a biography' do
      bio.biography = 'Updating'
      expect(bio.save).to be_true
    end
  end
end
