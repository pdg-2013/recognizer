class DateOfBirth < ActiveRecord::Base
  attr_accessible :date, :main_entry, :sdn_id, :uid

  belongs_to :sdn

  validates :uid, presence: true
  validates :date, presence: true
end
