class DateOfBirth < ActiveRecord::Base
  attr_accessible :date, :mainEntry, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :sdn_id, presence: true
  validates :date, presence: true
end
