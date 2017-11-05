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
    name { Faker::Coffee.blend_name }
    email { Faker::Internet.safe_email }
    description { Faker::Hacker.say_something_smart }
    url { Faker::Internet.url }
    phone { Faker::PhoneNumber.phone_number }
    office_hours do
      {
        sunday: { open_time: "12 PM", close_time: "5 PM" },
        monday: { open_time: "10 AM", close_time: "6 PM" },
        tuesday: { open_time: "10 AM", close_time: "6 PM" },
        wednesday: { open_time: "10 AM", close_time: "6 PM" },
        thursday: { open_time: "10 AM", close_time: "6 PM" },
        friday: { open_time: "10 AM", close_time: "6 PM" },
        saturday: { open_time: "10 AM", close_time: "5 PM" }
      }
    end
  end
end
