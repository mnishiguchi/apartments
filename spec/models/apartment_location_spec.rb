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

require "rails_helper"

RSpec.describe ApartmentLocation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
