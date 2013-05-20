module Ofac
	class << self
		attr_accessor :agent, :sdn

		# def url; "http://www.treasury.gov/ofac/downloads/sdn.xml"; end
		def url; "http://localhost:3000/sdn.xml"; end

		def fetch
			@agent ||= Mechanize.new

			xml = Nokogiri::XML @agent.get(url).body
			(xml/:sdnEntry).each do |entry|
				@sdn = Sdn.find_by_uid(entry.at(:uid).text.to_i)
				@sdn ||= Sdn.new


				set_sdn entry
				set_program entry
				set_place_of_birth entry
				set_nationality entry
				set_date_of_births entry
				set_akas entry
				# set_addresses entry

				@sdn.save!
			end
		end

		def set_sdn entry
			@sdn.uid = entry.at(:uid).text.to_i rescue nil
			@sdn.first_name = entry.at(:firstName).text rescue nil
			@sdn.last_name = entry.at(:lastName).text rescue nil
			@sdn.sdn_type = entry.at(:sdnType).text rescue nil
			@sdn.remarks = entry.at(:remarks).text rescue nil
		end

		def set_program entry
			@sdn.programs = []
			(entry/:program).each do |program|
				name = program.text rescue nil

				@sdn.programs << Program.new(name: name)
			end
		end

		def set_place_of_birth entry
			@sdn.place_of_births = []
			(entry/:placeOfBirthItem).each do |place_of_birth|
				uid = place_of_birth.at(:uid).text.to_i rescue nil
				place = place_of_birth.at(:placeOfBirth).text rescue nil
				main_entry = place_of_birth.at(:mainEntry).text rescue nil

				@sdn.place_of_births << PlaceOfBirth.new(uid: uid, place: place, main_entry: main_entry)
			end
		end

		def set_nationality entry
			@sdn.nationalities = []
			(entry/:nationality).each do |nationality|
				uid = nationality.at(:uid).text.to_i rescue nil
				country = nationality.at(:country).text rescue nil
				main_entry = nationality.at(:mainEntry).text rescue nil

				@sdn.nationalities << Nationality.new(uid: uid, country: country, main_entry: main_entry)
			end
		end

		def set_date_of_births entry
			@sdn.date_of_births = []
			(entry/:dateOfBirthItem).each do |date_of_births|
				uid = date_of_births.at(:uid).text.to_i rescue nil
				date = date_of_births.at(:dateOfBirth).text rescue nil
				main_entry = date_of_births.at(:mainEntry).text rescue nil

				@sdn.date_of_births << DateOfBirth.new(uid: uid, date: date, main_entry: main_entry)
			end
		end
	end
end