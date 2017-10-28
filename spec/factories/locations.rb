# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
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
    latitude 1.5
    longitude 1.5
    address_1 "MyString"
    address_2 "MyString"
    county "MyString"
    city "MyString"
    state "MyString"
    neighbourhood "MyString"
    postal_code "MyString"
    country "MyString"
  end
end
