# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  identifier :string           not null
#  title      :string           not null
#  tags       :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Amenity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
