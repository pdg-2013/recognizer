class Aka < ActiveRecord::Base
  attr_accessible :category, :first_name, :last_name, :type, :uid, :sdn_id

  belongs_to :sdn
end
