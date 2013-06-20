require 'spec_helper'

describe MediaPost do
  let(:media) { FactoryGirl.build(:media_post) }
  it { should validate_presence_of(:act) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:media_type) }

  it { should ensure_inclusion_of(:media_type).in_array(['youtube', 'soundcloud']) }

  it { should belong_to(:act) }

  describe 'with a youtube url' do
    it 'should save only the id of a standard youtube url' do
      media.save
      expect(MediaPost.last.url).to eql('xEhaVhta7sI')
    end

    it 'should save other formatted youtube links' do
      media.url = 'http://youtu.be/xEhaVhta7sI'
      media.save
      expect(MediaPost.last.url).to eql('xEhaVhta7sI')
    end

    it "shouldn't save non youtube links" do
      media.url = 'vimeo.com/1234'
      expect(media).to_not be_valid
    end

  end
end
