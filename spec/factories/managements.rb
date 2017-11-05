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
    name { Faker::Company.name }
    email { Faker::Internet.safe_email }
    identifier ""
    url { Faker::Internet.url }
    description { Faker::Hacker.say_something_smart }
  end
end
