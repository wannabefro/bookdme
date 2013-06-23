require 'spec_helper'

describe MediaPost do
  let(:media) { FactoryGirl.build(:media_post) }
  it { should validate_presence_of(:act) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:media_type) }


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

  describe 'an act can only have 3 youtube videos' do
    let!(:act) { FactoryGirl.create(:act) }
    let!(:prev_count) { MediaPost.count }
    let!(:youtube) { FactoryGirl.create_list(:media_post, 3, act: act) }

    it 'should allow 3 youtube urls to be saved' do
      expect(MediaPost.count).to eql(prev_count + 3)
    end

    it 'should not allow me to add a 4th youtube url' do
      fourth = FactoryGirl.build(:media_post, act: act)
      expect(fourth).to_not be_valid
    end
  end

  describe 'an act can only have 3 soundcloud links' do
    let!(:act) { FactoryGirl.create(:act) }
    let!(:prev_count) { MediaPost.count }
    let!(:soundcloud) { FactoryGirl.create_list(:soundcloud, 3, act: act) }

    it 'should allow 3 soundcloud urls to be saved' do
      expect(MediaPost.count).to eql(prev_count + 3)
    end

    it 'should not allow me to add a 4th soundcloud link' do
      fourth = FactoryGirl.build(:soundcloud, act: act)
      expect(fourth).to_not be_valid
    end
  end

  describe 'an act can only have 10 pictures' do
    let!(:act) { FactoryGirl.create(:act) }
    let!(:prev_count) { MediaPost.count }
    let!(:image) { FactoryGirl.create_list(:image_post, 10, act: act) }

    it 'should allow me to upload 10 images' do
      expect(MediaPost.count).to eql(prev_count + 10)
    end

    it 'should not allow me to upload 11 images' do
      eleventh = FactoryGirl.build(:image_post, act: act)
      expect(eleventh).to_not be_valid
    end
  end

end

