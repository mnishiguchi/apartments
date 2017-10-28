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

FactoryBot.define do
  factory :amenity do
    title "MyString"
    symbol "MyString"
    description "MyText"
    tags "MyString"
  end
end
