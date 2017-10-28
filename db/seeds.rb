# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

def load_apartments
  YAML.load_file Rails.root.join("db", "seeds", "apartments.yaml")
end

def load_floorplans
  YAML.load_file Rails.root.join("db", "seeds", "floorplans.yaml")
end

seed_amenity_keys = %w[
  agent_speaks_spanish
  alarm_systems
  atm_on_site
  business_center
  cable_satellite_available
  cat_friendly
  clubhouse_partyroom
  college
  comcast_apt_hashfinity
  community_recycling
  concierge_service
  convenience_store
  corporate
  covered_parking
  disability_barrier
  dog_friendly
  electric_available
  emergency_maint
  fios
  fireplace
  fitness_area
  furnished_available
  garage_parking
  gas_heat_available
  gated_community
  green_community
  hardwood_flooring
  high_speed_interwebs
  laundry_facilities_on_site
  luapt_hashury
  military
  near_bus_route
  near_dulles_toll
  near_marc
  near_metro
  near_vre
  new_community
  non_smoking
  off_street_parking
  one_mile_to_interstate
  pet_park
  picnic_bbq_area
  playground
  resident_activities
  shuttle_to_public_transport
  swimming_pool
  taapt_hash_credit_community
  tennis_courts
  utilities_included
  wash_dry
  wifi_available
  zipcar_access
]

floorplan_samples = load_floorplans

puts "Creating apartments"
Parallel.each(load_apartments, in_processes: 3) do |apt_hash|
  office_hours = {
    monday: {
      open_time: apt_hash["office_hours_monday_opens_at"],
      close_time: apt_hash["office_hours_monday_closes_at"]
    },
    tuesday: {
      open_time:  apt_hash["office_hours_tuesday_opens_at"],
      close_time: apt_hash["office_hours_tuesday_closes_at"]
    },
    wednesday: {
      open_time:  apt_hash["office_hours_wednesday_opens_at"],
      close_time: apt_hash["office_hours_wednesday_closes_at"]
    },
    thursday: {
      open_time:  apt_hash["office_hours_thursday_opens_at"],
      close_time: apt_hash["office_hours_thursday_closes_at"]
    },
    friday: {
      open_time:  apt_hash["office_hours_friday_opens_at"],
      close_time: apt_hash["office_hours_friday_closes_at"]
    },
    saturday: {
      open_time:  apt_hash["office_hours_saturday_opens_at"],
      close_time: apt_hash["office_hours_saturday_closes_at"]
    },
    sunday: {
      open_time:  apt_hash["office_hours_sunday_opens_at"],
      close_time: apt_hash["office_hours_sunday_closes_at"]
    }
  }

  # Create an apartment
  apartment = Apartment.new
  apartment_attributes = apt_hash.slice("name", "phone", "url", "description")
  apartment.update!(apartment_attributes.merge(office_hours: office_hours, email: apt_hash.dig("emails", 0)))

  # Set apartment's amenities
  activated_amenities = apt_hash.slice(*seed_amenity_keys).select { |_k, v| v }.keys
  amenities = (apt_hash["amenity_text"] || []) | activated_amenities
  if amenities.present?
    amenities.each do |amenity_title|
      identifier = amenity_title.parameterize.underscore
      amenity = Amenity.find_by(identifier: identifier) ||
                Amenity.find_by(title: amenity_title) ||
                Amenity.new(identifier: identifier, title: amenity_title)
      apartment.amenities << amenity
    end
  end

  # Set apartment's locations
  if apt_hash["address"]
    location = Location.find_by(latitude: apt_hash["latitude"], longitude: apt_hash["longitude"]) ||
               Location.new(latitude:    apt_hash["latitude"],
                            longitude:   apt_hash["longitude"],
                            address_1:   apt_hash["address"],
                            address_2:   apt_hash["address_line_2"],
                            city:        apt_hash["city"],
                            state:       apt_hash["state"],
                            county:      apt_hash["county"],
                            postal_code: apt_hash["zip"])
    apartment.locations << location
  end

  # Set apartment's management
  if apt_hash["management_name"] || apt_hash["management_url"]
    management = Management.find_by(url: apt_hash["management_url"]) ||
                 Management.find_by(name: apt_hash["management_name"]) ||
                 Management.new(url:         apt_hash["management_url"],
                                name:        apt_hash["management_name"],
                                description: apt_hash["management_description"])
    apartment.management = management
  end

  # Set apartment's floorplans
  floorplan_samples.sample.each do |fp_hash|
    apartment.floorplans.create!(name:                 fp_hash["name"],
                                 bathroom_count:       fp_hash["bathroom_count"],
                                 bedroom_count:        fp_hash["bedroom_count"],
                                 rent_min:             fp_hash["rent_min"],
                                 rent_max:             fp_hash["rent_max"],
                                 sqft_min:             fp_hash["square_feet_min"],
                                 sqft_max:             fp_hash["square_feet_max"],
                                 unit_count_total:     fp_hash["unit_count"],
                                 unit_count_available: fp_hash["units_available_today"],
                                 availabitity_url:     fp_hash["check_availability_url"],
                                 description:          fp_hash["description"])
  end

  print "."
end
puts
