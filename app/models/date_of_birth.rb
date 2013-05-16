class DateOfBirth < ActiveRecord::Base
  attr_accessible :date, :mainEntry, :sdn_id, :uid

  belongs_to :sdn
end
