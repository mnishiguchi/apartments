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

class ManagementLocation < ApplicationRecord
  belongs_to :management
  belongs_to :location
end
