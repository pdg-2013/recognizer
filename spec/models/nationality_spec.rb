require 'spec_helper'

describe Nationality do
  before { @nationality = FactoryGirl.build(:nationality) }

  subject { @nationality }

  it { should respond_to(:uid) }
  it { should respond_to(:sdn_id) }
  it { should respond_to(:country) }
  it { should respond_to(:main_entry) }

  it { should belong_to(:sdn) }

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:country) }
  it "should validate the presence of main_entry"

  it { should be_valid }
end