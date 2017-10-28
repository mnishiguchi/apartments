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

FactoryBot.define do
  factory :management_location do
    description "MyText"
    management nil
    location nil
  end
end
