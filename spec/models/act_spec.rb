require 'spec_helper'


describe Act do

  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should belong_to(:location) }
  it { should belong_to(:price) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:short_bio) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:custom_genre) }
  it { should validate_presence_of(:zipcode) }

  it { should have_many(:biographies) }
  it { should have_many(:proposals) }
  it { should have_many(:media_posts) }
  it { should have_many(:reviews) }

  it { should_not allow_value('123456').for(:zipcode) }
  it { should allow_value('02445').for(:zipcode) }
  it { should allow_value('12345-1234').for(:zipcode)}

  let!(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.build(:act) }

  it 'should create a valid act if everything is specified' do
    act.save
  end

  it 'should ensure that the act name does not contain obscenity' do
    act.name = 'shit'
    expect(act).to_not be_valid
  end

  it 'checks if the logged in user is the same as the act user' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'blah@example.com')

    act.user_id = user.id
    expect(act.owner? user).to be_true
    expect(act.owner? user2).to be_false

  end

  it 'checks that a cateogry is provided' do
    act = FactoryGirl.build(:act, category: nil)
    expect(act).to_not be_valid
  end

  it 'checks that a short-bio is not over 140 characters' do
    act = FactoryGirl.build(:act)
    act.short_bio = 's' * 500
    expect(act).to_not be_valid
  end

  it 'checks that a custom is not over 50 characters' do
    act = FactoryGirl.build(:act)
    act.custom_genre = 's' * 500
    expect(act).to_not be_valid
  end
end
