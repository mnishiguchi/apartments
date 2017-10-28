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

FactoryBot.define do
  factory :floorplan do
    name "MyString"
    identifier "MyString"
    image_url "MyString"
    bathrooms 1.5
    bedrooms 1.5
    rent "MyString"
    sqft "MyString"
    total_unit_count ""
    available_unit_count ""
    apartment nil
  end
end
