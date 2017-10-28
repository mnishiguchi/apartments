# == Schema Information
#
# Table name: apartment_amenities
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  amenity_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :apartment_amenity do
    apartment nil
    amenity nil
  end
end
