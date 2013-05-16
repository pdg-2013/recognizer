require 'spec_helper'

describe Sdn do
  before { @sdn = FactoryGirl.build(:sdn) }

  subject { @sdn }

  it { should respond_to(:uid) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:type) }
  it { should be_valid }

  describe "should validate the presence of uid" do
  	before { @sdn.uid = " " }
  	it { should_not be_valid }
  end

  describe "should validate the uniqueness of uid" do
  	before do 
  		sdn_with_same_uid = @sdn.dup
      sdn_with_same_uid.save
  	end
  	it { should_not be_valid }
  end

  describe "should validate the presence of last_name" do
  	before { @sdn.last_name = " " }
  	it { should_not be_valid }
  end

  describe "should validate the presence of type" do
  	before { @sdn.type = " " }
  	it { should_not be_valid }
  end
end
