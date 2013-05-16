class Address < ActiveRecord::Base
  attr_accessible :address1, :city, :country, :postcode, :uid

  validates :uid, presence: true
  validates :country, presence: true
end
