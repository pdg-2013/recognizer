class Nationality < ActiveRecord::Base
  attr_accessible :country, :main_entry, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :country, presence: true
end
