require 'spec_helper'

describe Aka do
  before { @aka = FactoryGirl.build(:aka) }

  subject { @aka }

  it { should respond_to(:uid) }
  it { should respond_to(:sdn_id) }
  it { should respond_to(:aka_type) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:category) }

  it { should belong_to(:sdn) }

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:aka_type) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:category) }

  it { should be_valid }
end