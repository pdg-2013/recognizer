class OfacController < ApplicationController
	respond_to :json, :xml

  def sdn
  	Ofac.fetch
  	respond_with Sdn.all
  end
end
