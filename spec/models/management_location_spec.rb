# == Schema Information
#
# Table name: management_locations
#
#  id            :integer          not null, primary key
#  description   :text
#  management_id :integer
#  location_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe ManagementLocation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
