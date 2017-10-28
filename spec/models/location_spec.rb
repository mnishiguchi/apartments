# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  latitude      :decimal(, )
#  longitude     :decimal(, )
#  address_1     :string
#  address_2     :string
#  county        :string
#  city          :string
#  state         :string
#  neighbourhood :string
#  postal_code   :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
