# == Schema Information
#
# Table name: apartments
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  description   :text
#  url           :string
#  phone         :string
#  office_hours  :jsonb
#  management_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe Apartment, type: :model do
  describe "ORM" do
    it "has correct columns" do
      should have_db_column(:name)
      should have_db_column(:email)
      should have_db_column(:description)
      should have_db_column(:url)
      should have_db_column(:phone)
      should have_db_column(:office_hours)
    end
  end

  it "has correct associations" do
    should have_many(:floorplans)
    should have_many(:locations)
    should have_many(:amenities)
  end

  it "is valid" do
    expect(create(:apartment)).to be_valid
  end
end
