require 'spec_helper'

describe Address do
  before { @address = FactoryGirl.build(:address) }

  subject { @address }

  it { should respond_to(:uid) }
  it { should respond_to(:address1) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:postcode) }
  it { should be_valid }

	describe "should validate the presence of uid" do
		before { @address.uid = " " }
		it { should_not be_valid }
	end

	describe "should validate the presence of country" do
		before { @address.country = " " }
		it { should_not be_valid }
	end
end