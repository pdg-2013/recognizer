class Program < ActiveRecord::Base
  attr_accessible :name, :sdn_id

  belongs_to :sdn

  validates :name, presence: true
end
