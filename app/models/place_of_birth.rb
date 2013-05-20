class PlaceOfBirth < ActiveRecord::Base
  attr_accessible :main_entry, :place, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :place, presence: true
  validates_inclusion_of :main_entry, :in => [true, false]
end
