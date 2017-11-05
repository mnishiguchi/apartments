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
  describe "ORM" do
    it "has correct columns" do
      should have_db_column(:identifier)
      should have_db_column(:title)
      should have_db_column(:tags)
    end
  end

  it "has correct associations" do
    should have_many(:apartments)
    should have_many(:floorplans)
  end

  it "is valid" do
    expect(create(:amenity)).to be_valid
  end
end
