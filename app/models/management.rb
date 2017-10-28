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

class Management < ApplicationRecord
  has_many :apartments

  has_many :management_locations
  has_many :locations, through: :management_locations
end
