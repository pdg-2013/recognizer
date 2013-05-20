class PlaceOfBirth < ActiveRecord::Base
  attr_accessible :mainEntry, :place, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :sdn_id, presence: true
  validates :place, presence: true
  validates_inclusion_of :mainEntry, :in => [true, false]
end
