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

class Amenity < ApplicationRecord
  has_many :apartment_amenities
  has_many :apartments, through: :apartment_amenities

  has_many :floorplan_amenities
  has_many :floorplans, through: :floorplan_amenities

  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
