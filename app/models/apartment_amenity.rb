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

class ApartmentAmenity < ApplicationRecord
  belongs_to :apartment
  belongs_to :amenity
end
