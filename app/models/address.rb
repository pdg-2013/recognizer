class Address < ActiveRecord::Base
  attr_accessible :address1, :city, :country, :postcode, :uid
end
