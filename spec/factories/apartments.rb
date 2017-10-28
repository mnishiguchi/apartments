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

FactoryBot.define do
  factory :apartment do
    name "MyString"
    email "MyString"
    description "MyText"
    url "MyString"
    phone "MyString"
  end
end
