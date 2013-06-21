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
      media
      expect(media).to be_valid
    end

    it 'should save other formatted youtube links' do
      media.url = 'http://youtu.be/xEhaVhta7sI'
      expect(media).to be_valid
    end

    it "shouldn't save non youtube links" do
      media.url = 'vimeo.com/1234'
      expect(media).to_not be_valid
    end

  end

  describe 'with a soundcloud url' do
    let(:soundcloud) { FactoryGirl.build(:media_post, media_type: 'soundcloud')}

      it 'should validate a soundcloud url' do
        prev_count = MediaPost.count
        soundcloud.url = 'https://soundcloud.com/aviciiofficial/avicii-promotional-mix-2013'
        soundcloud.save
        expect(MediaPost.count).to eql(prev_count + 1)
      end

      it "it shouldn't save a non soundcloud link" do
        soundcloud.url = 'bbc.com'
        expect(soundcloud).to_not be_valid
      end

  end
end
