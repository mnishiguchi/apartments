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
  describe "ORM" do
    it "has correct columns" do
      should have_db_column(:name)
      should have_db_column(:identifier)
      should have_db_column(:image_url)
      should have_db_column(:description)
      should have_db_column(:availabitity_url)
      should have_db_column(:bathroom_count)
      should have_db_column(:bedroom_count)
      should have_db_column(:rent_min)
      should have_db_column(:rent_max)
      should have_db_column(:sqft_min)
      should have_db_column(:sqft_max)
      should have_db_column(:unit_count_total)
      should have_db_column(:unit_count_available)
    end
  end

  it "has correct associations" do
    should belong_to(:apartment)
    should have_many(:amenities)
  end

  it "is valid" do
    expect(create(:floorplan)).to be_valid
  end
end
