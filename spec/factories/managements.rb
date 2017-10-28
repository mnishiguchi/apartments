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

FactoryBot.define do
  factory :management do
    name "MyString"
    email "MyString"
    identifier "MyString"
    url "MyString"
    description "MyText"
  end
end
