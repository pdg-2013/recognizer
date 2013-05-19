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
          # :name
          xml.tag!(:program, program.name)
        end
      end
      xml.addressList do
        xml.address do
          self.addresses.each do |address|
            # :address1, :city, :country, :postcode, :uid
            xml.tag!(:uid, address.uid)
            xml.tag!(:address1, address.address1)
            xml.tag!(:city, address.city)
            xml.tag!(:country, address.country)
            xml.tag!(:postcode, address.postcode)
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