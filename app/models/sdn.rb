class Sdn < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :sdn_type, :uid, :remarks

  has_many :addresses, :dependent => :destroy
  has_many :programs,  :dependent => :destroy
  has_many :akas,      :dependent => :destroy
  has_many :nationalities, :dependent => :destroy
  has_many :date_of_births, :dependent => :destroy
  has_many :place_of_births, :dependent => :destroy

  validates :uid, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :sdn_type, presence: true


  def to_xml(options = {})
    require 'builder'
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(indent: options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.sdnEntry do
      xml.tag!(:uid, self.uid)
      xml.tag!(:firstName, self.first_name)
      xml.tag!(:lastName, self.last_name)
      xml.tag!(:sdnType, self.sdn_type)
      xml.tag!(:remarks, self.remarks)
      xml.programList do
        self.programs.each do |program|
          xml.tag!(:program, program.name)
        end 
      end
      xml.addressList do
        xml.address do
          self.addresses.each do |unit|
            xml.tag!(:uid, unit.uid)
            xml.tag!(:address1, unit.address1)
            xml.tag!(:city, unit.city)
            xml.tag!(:country, unit.country)
            xml.tag!(:postcode, unit.postcode)
          end
        end
      end
      xml.placeOfBirthList do
        self.place_of_births.each do |unit|
          xml.placeOfBirthItem do
            xml.tag!(:uid, unit.uid)
            xml.tag!(:placeOfBirth, unit.place)
            xml.tag!(:mainEntry, unit.main_entry)
          end
        end
      end
      xml.nationalityList do
        self.nationalities.each do |unit|
          xml.nationality do
            xml.tag!(:uid, unit.uid)
            xml.tag!(:country, unit.country)
            xml.tag!(:mainEntry, unit.main_entry)
          end
        end
      end
      xml.dateOfBirthList do
        self.date_of_births.each do |unit|
          xml.dateOfBirthItem do
            xml.tag!(:uid, unit.uid)
            xml.tag!(:dateOfBirth, unit.date)
            xml.tag!(:mainEntry, unit.main_entry)
          end
        end
      end
    end
  end

  def as_json(options = {})
    require 'json'

    {
      uid: self.uid,
      firstName: self.first_name,
      lastName: self.last_name,
      sdnType: self.sdn_type,
      remarks: self.remarks,
      programList: [{
        program: "CUBA"
      }]
    }
  end
end