class OfacController < ApplicationController
	respond_to :json, :xml

  def sdn
  	Ofac.fetch
  	respond_with Sdn.find_by_uid(7843)
  end
end
