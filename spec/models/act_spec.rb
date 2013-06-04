require 'spec_helper'
require 'pry'


describe Act do
  let!(:user) { FactoryGirl.create(:user) }
  let(:act) { FactoryGirl.build(:act) }

  it 'should ensure that the act name does not contain obscenity' do
    act.name = 'shit'
    expect(act).to_not be_valid
  end
end
