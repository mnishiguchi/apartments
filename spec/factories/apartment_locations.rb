# == Schema Information
#
# Table name: apartment_locations
#
#  id           :integer          not null, primary key
#  description  :text
#  apartment_id :integer
#  location_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :apartment_location do
    description "MyText"
    apartment nil
    location nil
  end
end
