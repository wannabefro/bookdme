require 'spec_helper'
require 'pry'


describe Act do

  it { should belong_to(:user) }
  it { should belong_to(:category)}
  it { should belong_to(:location)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:category)}
  it { should validate_presence_of(:location)}

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
end
