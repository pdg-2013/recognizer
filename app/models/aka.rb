class Aka < ActiveRecord::Base
  attr_accessible :category, :first_name, :last_name, :aka_type, :uid, :sdn_id

  belongs_to :sdn
end
