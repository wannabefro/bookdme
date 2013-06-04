require 'spec_helper'

describe 'abilities associated with each role' do

  let(:user) { FactoryGirl.build(:user) }
  let(:act) { FactoryGirl.build(:user, :act) }

  it 'should not allow an act to sign up unless their role is an act' do
    ability = Ability.new(user)
    assert ability.cannot?(:create, Act.new)
  end

  it 'should allow you to create an act profile if your role is an act' do
    ability = Ability.new(act)
    assert ability.can?(:create, Act.new)
  end
end