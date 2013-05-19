module Ofac
	class << self
		attr_accessor :agent, :sdn

		def url; "http://www.treasury.gov/ofac/downloads/sdn.xml"; end

		def fetch
			@agent ||= Mechanize.new

			xml = Nokogiri::XML @agent.get(url).body
			(xml/:sdnEntry).each do |entry|
				@sdn = Sdn.find_by_uid(entry.at(:uid).text.to_i)
				@sdn ||= Sdn.new
				set_sdn entry
				# set_program entry
				# set_place_of_birth entry
				# set_nationality entry
				# set_date_of_births entry
				# set_akas entry
				# set_addresses entry

				@sdn.save
			end
		end

		def set_sdn entry
			# :first_name, :last_name, :sdn_type, :uid, :remarks
			@sdn.uid = entry.at(:uid).text.to_i  rescue nil
			@sdn.first_name = entry.at(:firstName).text  rescue nil
			@sdn.last_name = entry.at(:lastName).text rescue nil
			@sdn.sdn_type = entry.at(:sdnType).text rescue nil
			@sdn.remarks = entry.at(:remarks).text rescue nil
		end
	end
end