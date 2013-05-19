require 'spec_helper'

describe OfacController do

  describe "GET 'sdn'" do
    it "returns http success" do
      get 'sdn'
      response.should be_success
    end
  end

end
