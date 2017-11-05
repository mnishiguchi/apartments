# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  layer         :string
#  latitude      :decimal(, )
#  longitude     :decimal(, )
#  address_1     :string
#  address_2     :string
#  county        :string
#  city          :string
#  state         :string
#  neighbourhood :string
#  postal_code   :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :location do
    latitude { Faker::Number.between(36.540759, 39.466012) }
    longitude  { Faker::Number.between(-83.675395, -75.166435) }
    address_1 { Faker::Address.street_address }
    address_2 ""
    county "Washington"
    city "Washington"
    state { %w[DC MD VA].sample }
    neighbourhood { Faker::Address.community }
    postal_code { Faker::Address.zip_code }
    country ""
  end
end
