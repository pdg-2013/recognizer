require 'spec_helper'

describe DateOfBirth do
  before { @date_of_birth = FactoryGirl.build(:date_of_birth) }

  subject { @date_of_birth }

  it { should respond_to(:uid) }
  it { should respond_to(:sdn_id) }
  it { should respond_to(:date) }
  it { should respond_to(:mainEntry) }

  it { should belong_to(:sdn) }

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:sdn_id) }
  it { should validate_presence_of(:date) }
  it "should validate the presence of mainEntry"
  
  it { should be_valid }
end