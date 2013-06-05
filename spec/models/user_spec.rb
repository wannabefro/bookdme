require 'spec_helper'

describe User do

  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}

  let(:user) { FactoryGirl.build(:user) }
  let!(:previous_count) { User.count }

  it 'should not login if no names are specified' do
    user.first_name = ''
    user.last_name = ''
    user.save
    expect(User.count).to eql(previous_count)
  end

  it 'should not login if an email is invalid' do
    user.email = 'sam.com'
    user.save
    expect(User.count).to eql(previous_count)
  end

  it 'checks if a password has more than 7 characters' do
    user.password = 'dumdumd'
    user.save
    expect(User.count).to eql(previous_count)
  end

end
