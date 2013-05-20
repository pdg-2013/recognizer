require 'spec_helper'

describe Program do
  before { @program = FactoryGirl.build(:program) }
  subject { @program }

  it { should respond_to(:name) }
  it { should respond_to(:sdn_id) }

  it { should belong_to(:sdn) }

  it { should validate_presence_of(:name) }
  
  it { should be_valid }
end
