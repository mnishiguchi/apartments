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

require "rails_helper"

RSpec.describe ApartmentAmenity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
