# == Schema Information
#
# Table name: floorplan_amenities
#
#  id           :integer          not null, primary key
#  floorplan_id :integer
#  amenity_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FloorplanAmenity < ApplicationRecord
  belongs_to :floorplan
  belongs_to :amenity
end
