# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  identifier :string           not null
#  title      :string           not null
#  tags       :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  amenities = ["air-conditioning",
               "washer-dryer",
               "dishwasher",
               "parking",
               "fitness-center",
               "wheelchair-accessible",
               "pool",
               "furnished",
               "elevator",
               "washer-dryer-hookup",
               "laundry-facilities"]

  factory :amenity do
    sequence :identifier do |n|
      amenities[n % amenities.size] + "-#{n}"
    end
    title { identifier }
    tags { [] }
  end
end
