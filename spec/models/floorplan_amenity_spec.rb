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

require "rails_helper"

RSpec.describe FloorplanAmenity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
