class Aka < ActiveRecord::Base
  attr_accessible :category, :first_name, :last_name, :aka_type, :uid, :sdn_id

  belongs_to :sdn

  validates :uid, presence: true
  validates :last_name, presence: true
  validates :aka_type, presence: true
  validates :category, presence: true
end
