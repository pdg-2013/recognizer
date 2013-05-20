class Nationality < ActiveRecord::Base
  attr_accessible :country, :mainEntry, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :sdn_id, presence: true
  validates :country, presence: true
end
