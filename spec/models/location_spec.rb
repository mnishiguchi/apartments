# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  layer         :string
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
  describe "ORM" do
    it "has correct columns" do
      should have_db_column(:layer)
      should have_db_column(:latitude)
      should have_db_column(:longitude)
      should have_db_column(:address_1)
      should have_db_column(:address_2)
      should have_db_column(:county)
      should have_db_column(:city)
      should have_db_column(:state)
      should have_db_column(:neighbourhood)
      should have_db_column(:postal_code)
      should have_db_column(:country)
    end
  end

  it "has correct associations" do
    should have_many(:apartments)
    should have_many(:managements)
  end

  it "is valid" do
    expect(create(:location)).to be_valid
  end
end
