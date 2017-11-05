# == Schema Information
#
# Table name: managements
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  identifier  :string
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Management, type: :model do
  describe "ORM" do
    it "has correct columns" do
      should have_db_column(:name)
      should have_db_column(:email)
      should have_db_column(:identifier)
      should have_db_column(:url)
      should have_db_column(:description)
    end
  end

  it "has correct associations" do
    should have_many(:apartments)
    should have_many(:locations)
  end

  it "is valid" do
    expect(create(:management)).to be_valid
  end
end
