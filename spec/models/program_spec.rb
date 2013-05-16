require 'spec_helper'

describe Program do
  before { @program = FactoryGirl.build(:program) }

  subject { @program }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "should validate the presence of name" do
  	before { @program.name = " " }
  	it { should_not be_valid }
  end
end
