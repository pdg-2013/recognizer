class Nationality < ActiveRecord::Base
  attr_accessible :country, :mainEntry, :sdn_id, :uid

  belongs_to :sdn
end
