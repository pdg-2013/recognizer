class OfacController < ApplicationController
	respond_to :json, :xml

  def sdn
  	respond_with Sdn.all
  end
end
