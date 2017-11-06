# == Schema Information
#
# Table name: floorplans
#
#  id                   :integer          not null, primary key
#  name                 :string
#  identifier           :string
#  image_url            :string
#  description          :string
#  availabitity_url     :string
#  bathroom_count       :decimal(, )
#  bedroom_count        :decimal(, )
#  rent_min             :integer
#  rent_max             :integer
#  sqft_min             :integer
#  sqft_max             :integer
#  unit_count_total     :integer
#  unit_count_available :integer
#  apartment_id         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryBot.define do
  bedroom_counts = [0.5, 1.0, 2.0, 3.0, 4.0]
  bathroom_counts = [1.0, 2.0, 3.0, 4.0]

  factory :floorplan do
    sequence :identifier do |_n|
      Faker::Code.isbn
    end
    name { identifier }
    description { Faker::Hacker.say_something_smart }
    image_url { Faker::Internet.url }
    availabitity_url { Faker::Internet.url }
    bathroom_count { bathroom_counts.sample }
    bedroom_count  { bedroom_counts.sample }
    rent_min { Faker::Number.between(700, 3500) }
    rent_max { rent_min + Faker::Number.between(0, 1000) }
    sqft_min { Faker::Number.between(300, 2500) }
    sqft_max { sqft_min + Faker::Number.between(0, 1000) }
    unit_count_total { Faker::Number.between(5, 10) }
    unit_count_available { unit_count_total - Faker::Number.between(0, 5) }
    apartment
  end
end
