require 'spec_helper'
require 'pry'


describe Act do
  let(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.build(:act) }

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
end
