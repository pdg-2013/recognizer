class Address < ActiveRecord::Base
  attr_accessible :address1, :city, :country, :postcode, :uid, :sdn_id

  belongs_to :sdn

  validates :uid, presence: true
  validates :sdn_id, presence: true
  validates :country, presence: true
end
