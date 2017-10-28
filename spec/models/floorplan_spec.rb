# == Schema Information
#
# Table name: floorplans
#
#  id                   :integer          not null, primary key
#  name                 :string
#  identifier           :string
#  image_url            :string
#  description          :string
#  availabitity_url     :string
#  bathroom_count       :decimal(, )
#  bedroom_count        :decimal(, )
#  rent_min             :integer
#  rent_max             :integer
#  sqft_min             :integer
#  sqft_max             :integer
#  unit_count_total     :integer
#  unit_count_available :integer
#  apartment_id         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require "rails_helper"

RSpec.describe Floorplan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
