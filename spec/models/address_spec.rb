require 'spec_helper'

describe Address do
  before { @address = FactoryGirl.build(:address) }

  subject { @address }

  it { should respond_to(:uid) }
  it { should respond_to(:sdn_id) }
  it { should respond_to(:address1) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:postcode) }

  it { should belong_to(:sdn) }

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:country) }

  it { should be_valid }
end