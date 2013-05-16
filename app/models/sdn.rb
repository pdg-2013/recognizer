class Sdn < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :type, :uid, :remarks

  has_many :addresses, :dependent => :destroy
  has_many :programs,  :dependent => :destroy
  has_many :akas,      :dependent => :destroy
  has_many :nationalities, :dependent => :destroy
  has_many :date_of_births, :dependent => :destroy
  has_many :place_of_births, :dependent => :destroy

  validates :uid, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :type, presence: true
end
