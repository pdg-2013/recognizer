require 'spec_helper'

describe Aka do
  before { @aka = FactoryGirl.build(:aka) }

  subject { @aka }

  it { should respond_to(:uid) }
  it { should respond_to(:type) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:category) }
  it { should be_valid }
end