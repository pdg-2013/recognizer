require 'spec_helper'

describe Nationality do
  before { @nationality = FactoryGirl.build(:nationality) }

  subject { @nationality }

  it { should respond_to(:uid) }
  it { should respond_to(:sdn_id) }
  it { should respond_to(:country) }
  it { should respond_to(:mainEntry) }
  it { should be_valid }
end