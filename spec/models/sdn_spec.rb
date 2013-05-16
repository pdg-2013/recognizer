require 'spec_helper'

describe Sdn do
  before { @sdn = FactoryGirl.build(:sdn) }

  subject { @sdn }

  it { should respond_to(:uid) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:type) }
  it { should respond_to(:remarks) }
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

  it "should have a addresses method" do
    @sdn.should respond_to(:addresses)
  end

  it "should have a programs method" do
    @sdn.should respond_to(:programs)
  end

  it "should have a akas method" do
    @sdn.should respond_to(:akas)
  end

  it "should have a nationalities method" do
    @sdn.should respond_to(:nationalities)
  end

  it "should have a date_of_births method" do
    @sdn.should respond_to(:date_of_births)
  end

  it "should have a date_of_births method" do
    @sdn.should respond_to(:place_of_births)
  end
end
