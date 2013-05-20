require 'spec_helper'

describe Sdn do
  before { @sdn = FactoryGirl.build(:sdn) }

  subject { @sdn }

  it { should respond_to(:uid) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:sdn_type) }
  it { should respond_to(:remarks) }

  it { should have_many(:addresses) }
  it { should have_many(:programs) }
  it { should have_many(:akas) }
  it { should have_many(:nationalities) }
  it { should have_many(:date_of_births) }
  it { should have_many(:place_of_births) }

  it { should validate_presence_of(:uid) }
  it { should validate_uniqueness_of(:uid) }
  
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:sdn_type) }

  it { should be_valid }
end
