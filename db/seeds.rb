# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

amenity_keys = [
  "air-conditioning",
  "washer-dryer",
  "dishwasher",
  "parking",
  "fitness-center",
  "wheelchair-accessible",
  "pool",
  "furnished",
  "elevator",
  "washer-dryer-hookup",
  "laundry-facilities"
]

def create_management
  Management.create!(
    identifier: Faker::Code.isbn,
    name: Faker::Company.name,
    email: Faker::Internet.safe_email,
    url: Faker::Internet.url,
    description: Faker::Hacker.say_something_smart
  )
end

def create_apartment(location:, management:)
  Apartment.create!(
    name: "#{Faker::Coffee.blend_name} #{Faker::Crypto.md5[0..7]}",
    email: Faker::Internet.safe_email,
    description: Faker::Hacker.say_something_smart,
    url: Faker::Internet.url,
    phone: Faker::PhoneNumber.phone_number,
    office_hours: {
      sunday: { open_time: "12 PM", close_time: "5 PM" },
      monday: { open_time: "10 AM", close_time: "6 PM" },
      tuesday: { open_time: "10 AM", close_time: "6 PM" },
      wednesday: { open_time: "10 AM", close_time: "6 PM" },
      thursday: { open_time: "10 AM", close_time: "6 PM" },
      friday: { open_time: "10 AM", close_time: "6 PM" },
      saturday: { open_time: "10 AM", close_time: "5 PM" }
    },
    management: management,
    locations: [location]
  )
end

def create_floorplan(apartment:)
  identifier = Faker::Code.isbn
  bedroom_count = [0.5, 1.0, 2.0, 3.0, 4.0].sample
  bathroom_count = [1.0, 2.0, 3.0, 4.0].sample
  rent_min = Faker::Number.between(700, 3500)
  sqft_min = Faker::Number.between(300, 2500)
  unit_count_total = Faker::Number.between(5, 10)

  apartment.floorplans.create!(
    name: identifier,
    identifier: identifier,
    description: Faker::Hacker.say_something_smart,
    image_url: Faker::Internet.url,
    availabitity_url: Faker::Internet.url,
    bathroom_count: bathroom_count,
    bedroom_count: bedroom_count,
    rent_min: rent_min,
    rent_max: rent_min + Faker::Number.between(0, 1000),
    sqft_min: sqft_min,
    sqft_max: sqft_min + Faker::Number.between(0, 1000),
    unit_count_total: unit_count_total,
    unit_count_available: unit_count_total - Faker::Number.between(0, 5)
  )
end

locations_data = YAML.load_file Rails.root.join("db", "seeds", "locations.yaml")
puts "Loaded data for #{locations_data.size} locations"

puts "Seeding database"
# https://github.com/jfelchner/ruby-progressbar/wiki/Basic-Usage
progressbar = ProgressBar.create(total: locations_data.size, length: 80)

ActiveRecord::Base.transaction do
  # Create managements
  5.times { create_management }

  locations_data.each do |location_data|
    # Create an apartment
    apartment = create_apartment(location: Location.create!(location_data),
                                 management: Management.order("RANDOM()").first)

    # Create floorplans for this apartment
    Faker::Number.between(2, 5).times do
      apartment.floorplans << create_floorplan(apartment: apartment)
    end

    # Create amanities for this apartment
    amenity_keys.sample(Faker::Number.between(0, 5)).each do |amenity_key|
      apartment.amenities << Amenity.find_or_initialize_by(identifier: amenity_key,
                                                           title: amenity_key.titleize)
    end

    progressbar.increment
  end
end

# Print created record counts.
puts "-" * 80
[Management, Apartment, Floorplan, Location, Amenity].each do |klass|
  count = klass.count
  puts "Created #{count} #{klass.to_s.downcase.pluralize(count)}"
end
puts "-" * 80
